import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_clean_architecture/core/utils/interceptors.dart'
    as interceptors;
import 'package:flutter_app_clean_architecture/app/data/repositories/attendance_repository_impl.dart';
import 'package:flutter_app_clean_architecture/app/data/repositories/class_repository_impl.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/attendance_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/class_remote_source.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/attendance_repository.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/class_repository.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/attendance/get_attendance_stat_use_case.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/attendance/request_to_attend_use_case.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/class/get_list_class_use_case.dart';
import 'package:flutter_app_clean_architecture/app/presentation/attendance_stat/attendance_stat.dart';
import 'package:flutter_app_clean_architecture/app/presentation/class_detail.dart';
import 'package:flutter_app_clean_architecture/app/presentation/schedule/widget/list_schedule.dart';
import 'package:flutter_app_clean_architecture/app/domain/use_cases/user/identify_device_use_case.dart';
import 'package:flutter_app_clean_architecture/core/utils/device_info.dart';
import 'package:flutter_app_clean_architecture/core/utils/network_info.dart';
import 'package:flutter_app_clean_architecture/app/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_architecture/app/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/app/domain/repositories/login_repository.dart';
import 'app/domain/entities/custom_user.dart';
import 'app/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/app/presentation/profile/bloc/profile_bloc.dart';
import 'app/domain/use_cases/authentication/login_with_email_and_password.dart';
import 'app/domain/use_cases/user/update_user_profile.dart';
import 'app/presentation/authentication/widgets/login.dart';
import 'package:get_it/get_it.dart';
import 'app/data/repositories/user_repository_impl.dart';
import 'app/data/sources/remote_sources/user_remote_source.dart';
import 'app/domain/repositories/user_repository.dart';
import 'app/presentation/main_screen.dart';
import 'app/presentation/profile/widget/user_infomation_screen.dart';
import 'app/presentation/qrcode/pages/qr_generator.dart';
import 'app/presentation/qrcode/pages/qr_scan.dart';
import 'global_constants/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  await PlatformInfo.init();
  runApp(MyApp());
}

Future<void> init() async {
  GetIt getIt = GetIt.instance;
  var options = BaseOptions(
    baseUrl: 'http://192.168.1.86:8000',
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );
  getIt.registerSingleton<StreamController<bool>>(StreamController<bool>());
  getIt.registerSingleton(Dio(options)
    ..interceptors.addAll([
      interceptors.AuthenticationInterceptor(),
      interceptors.RefreshTokenInteceptor(),
      LogInterceptor(
          requestBody: true, requestHeader: false, responseBody: true),
    ]));
  getIt.registerLazySingleton<LoginWithUserNameAndPasswordUseCase>(
      () => LoginWithUserNameAndPasswordUseCase(getIt()));
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()));
  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginAPISource());
  getIt.registerLazySingleton<GetUserInformationUseCase>(
      () => GetUserInformationUseCase(repository: getIt()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteSource: getIt<UserRemoteSource>()));
  getIt.registerLazySingleton<UserRemoteSource>(() => UserAPISource());

  getIt.registerLazySingleton<ProfileBloc>(() => ProfileBloc(getIt(), getIt()));
  getIt.registerLazySingleton<UpdateUserProfileUseCase>(
      () => UpdateUserProfileUseCase(repository: getIt()));
  getIt.registerLazySingleton<IdentifyDeviceUseCase>(
      () => IdentifyDeviceUseCase(getIt()));

  getIt.registerLazySingleton<ClassRepository>(
      () => ClassRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ClassRemoteSource>(() => ClassRemoteSource());
  getIt.registerLazySingleton<GetListClassUseCase>(
      () => GetListClassUseCase(getIt()));

  getIt.registerLazySingleton<AttendanceRemoteSource>(
      () => AttendanceRemoteSource());
  getIt.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(getIt()));
  getIt.registerLazySingleton<RequestToAttendUseCase>(
      () => RequestToAttendUseCase(getIt()));
  getIt.registerLazySingleton<GetAttendanceStatUseCase>(
      () => GetAttendanceStatUseCase(getIt()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var subscription;
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      NetworkInfo.instance.isConnecting = result != ConnectivityResult.none;
    });
    GetIt.instance<StreamController<bool>>().stream.listen((event) {
      if (!event) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Login session expired"),
                  content:
                      Text("You need to log in to continue to use our app."),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.routeLogin, (route) => false);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        color: Colors.red,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ));
      }
    });
  }

  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        AppRoutes.routeQRGenerator: (context) => QRGenerator(),
        AppRoutes.routeQRScan: (_) => QRScan(),
        AppRoutes.routeMain: (_) => MainScreen(),
        AppRoutes.routeLogin: (context) => Login(),
        AppRoutes.routeUserInfor: (context) => UserInformation(),
        AppRoutes.routeListClass: (context) => ListSchedule(),
        AppRoutes.routeAttendance: (context) => AttendanceStat(),
        AppRoutes.routeClassDetail: (context) => ClassDetail(),
        // '/profile':(context) => ProfileScreen(),
      },
    );
  }
}
