import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_clean_architecture/global/app_routes.dart';
import 'package:flutter_app_clean_architecture/core/platform/device_info.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/data/sources/remote_sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/presentation/home/bloc/home_bloc.dart';
import 'features/domain/use_cases/user/get_user_info.dart';
import 'package:flutter_app_clean_architecture/features/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_app_clean_architecture/features/qrcode/presentation/pages/qr_generator.dart';
import 'package:flutter_app_clean_architecture/features/qrcode/presentation/pages/qr_options_page.dart';
import 'features/domain/use_cases/authentication/login_with_email_and_password.dart';
import 'features/domain/use_cases/user/update_user_profile.dart';
import 'features/presentation/authentication/bloc/login_bloc.dart';
import 'features/presentation/authentication/widgets/login.dart';
import 'package:get_it/get_it.dart';
import 'features/data/repositories/user_repository_impl.dart';
import 'features/data/sources/remote_sources/user_remote_source.dart';
import 'features/domain/repositories/user_repository.dart';
import 'features/presentation/main_screen.dart';
import 'features/presentation/profile/widget/user_infomation_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  await PlatformInfo.init();
  runApp(MyApp());
}

Future<void> init() async {
  GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  var options = BaseOptions
    (
    baseUrl: 'http://20.188.121.133:3000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  getIt.registerSingleton(Dio(options));

  getIt.registerFactory(() => LoginBloc(
      loginWithEmailAndPassword: getIt(),
  ));
  getIt.registerLazySingleton<LoginWithUserNameAndPasswordUseCase>(() => LoginWithUserNameAndPasswordUseCase(getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()));
  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginAPISource());

  getIt.registerLazySingleton<HomeBloc>(()=>HomeBloc(
      getUserInformation: getIt()
    )
  );
  getIt.registerLazySingleton<GetUserInformation>(()=>GetUserInformation(repository: getIt()));
  getIt.registerLazySingleton<UserRepository>(()=>HomeRepositoryImpl(remoteSource: getIt<UserRemoteSource>()));
  getIt.registerLazySingleton<UserRemoteSource>(() => UserAPISource());

  getIt.registerLazySingleton<ProfileBloc>(() => ProfileBloc(getIt(), getIt()));
  getIt.registerLazySingleton<UpdateUserProfile>(() => UpdateUserProfile(repository: getIt()));
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
        AppRoutes.routeQROptions:(context) => QROptions(),
         AppRoutes.routeQRGenerator:(context) => QRGenerator(),
        AppRoutes.routeMain:(_) => MainScreen(),
        AppRoutes.routeLogin:(context) => Login(),
        AppRoutes.routeUserInfor:(context) => UserInformation(),
    // '/profile':(context) => ProfileScreen(),
      },
    );
  }
}