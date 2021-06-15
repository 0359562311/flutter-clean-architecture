import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_clean_architecture/features/data/repositories/attendance_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/data/repositories/class_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/attendance_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/class_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/attendance_repository.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/class_repository.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/attendance/request_to_attend_use_case.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/class/get_list_class_use_case.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/attendance.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/class_detail.dart';
import 'package:flutter_app_clean_architecture/features/presentation/schedule/widget/list_class.dart';
import 'package:flutter_app_clean_architecture/features/domain/use_cases/user/identify_device_use_case.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_app_clean_architecture/core/platform/device_info.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/login_repository.dart';
import 'features/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/bloc/profile_bloc.dart';
import 'features/domain/use_cases/authentication/login_with_email_and_password.dart';
import 'features/domain/use_cases/user/update_user_profile.dart';
import 'features/presentation/authentication/widgets/login.dart';
import 'package:get_it/get_it.dart';
import 'features/data/repositories/user_repository_impl.dart';
import 'features/data/sources/remote_sources/user_remote_source.dart';
import 'features/domain/repositories/user_repository.dart';
import 'features/presentation/main_screen.dart';
import 'features/presentation/profile/widget/user_infomation_screen.dart';
import 'features/presentation/qrcode/pages/qr_generator.dart';
import 'features/presentation/qrcode/pages/qr_scan.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  await PlatformInfo.init();
  runApp(MyApp());
}

Future<void> init() async {
  GetIt getIt = GetIt.instance;
  var options = BaseOptions
    (
    baseUrl: 'http://20.188.121.133:3000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  getIt.registerSingleton(Dio(options)..interceptors.add(InterceptorsWrapper(
    onRequest: (option,handler) {
      print("\n\n\n");
      print("onrequest ${option.method} ${option.path}");
      print(option.data);
      print("=============Request==============");
      handler.next(option);
    },
    onResponse: (response,handler){
      print("\n\n\n");
      print("onresponse ${response.requestOptions.path}");
      print(response.data);
      print(response.statusCode);
      print("=============SUCCESS==============");
      handler.next(response);
    },
    onError: (error, handler){
      print("\n\n\n");
      print(error.response?.data);
      print(error.response?.statusCode);
      print("===============FAIL============");
      handler.reject(error);
    }
  )));
  getIt.registerLazySingleton<LoginWithUserNameAndPasswordUseCase>(() => LoginWithUserNameAndPasswordUseCase(getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()));
  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginAPISource());
  getIt.registerLazySingleton<GetUserInformationUseCase>(()=>GetUserInformationUseCase(repository: getIt()));
  getIt.registerLazySingleton<UserRepository>(()=>UserRepositoryImpl(remoteSource: getIt<UserRemoteSource>()));
  getIt.registerLazySingleton<UserRemoteSource>(() => UserAPISource());

  getIt.registerLazySingleton<ProfileBloc>(() => ProfileBloc(getIt(), getIt()));
  getIt.registerLazySingleton<UpdateUserProfileUseCase>(() => UpdateUserProfileUseCase(repository: getIt()));
  getIt.registerLazySingleton<IdentifyDeviceUseCase>(() => IdentifyDeviceUseCase(getIt()));

  getIt.registerLazySingleton<ClassRepository>(() => ClassRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ClassRemoteSource>(() => ClassRemoteSource());
  getIt.registerLazySingleton<GetListClassUseCase>(() => GetListClassUseCase(getIt()));

  getIt.registerLazySingleton<AttendanceRemoteSource>(() => AttendanceRemoteSource());
  getIt.registerLazySingleton<AttendanceRepository>(() => AttendanceRepositoryImpl(getIt()));
  getIt.registerLazySingleton<RequestToAttendUseCase>(() => RequestToAttendUseCase(getIt()));

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var subscription;
  void initState(){
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      NetworkInfo.instance.isConnecting = result != ConnectivityResult.none;
    });
  }

  void dispose(){
    super.dispose();
    subscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        AppRoutes.routeQRGenerator:(context) => QRGenerator(),
        AppRoutes.routeQRScan: (_) => QRScan(),
        AppRoutes.routeMain:(_) => MainScreen(),
        AppRoutes.routeLogin:(context) => Login(),
        AppRoutes.routeUserInfor:(context) => UserInformation(),
        AppRoutes.routeListClass:(context) => ListClass(),
        AppRoutes.routeAttendance:(context) => Attendance(),
        AppRoutes.routeClassDetail:(context) => ClassDetail(),
    // '/profile':(context) => ProfileScreen(),
      },
    );
  }
}