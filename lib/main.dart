import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_clean_architecture/constants.dart';
import 'package:flutter_app_clean_architecture/core/platform/device_info.dart';
import 'package:flutter_app_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/authentication/data/sources/login_remote_sources.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_email_and_password.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_facebook.dart';
import 'package:flutter_app_clean_architecture/features/authentication/domain/usecases/login_with_google.dart';
import 'package:flutter_app_clean_architecture/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_architecture/features/home/domain/use_cases/get_user_info.dart';
import 'package:flutter_app_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_app_clean_architecture/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_app_clean_architecture/features/profile/data/source/profile_remote_source.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_app_clean_architecture/features/profile/domain/use%20cases/update_user_profile.dart';
import 'package:flutter_app_clean_architecture/features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/domain/use cases/get_user_profile.dart';
import 'file:///F:/programming/AndroidStudio%20Projects/flutter-clean-architecture/lib/features/profile/presentation/pages/user_infomation_screen.dart';
import 'package:get_it/get_it.dart';
import 'features/authentication/presentation/widgets/login.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/data/sources/home_remote_source.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/main_screen/main_screen.dart';
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
      loginWithGoogle: getIt(),
      loginWithFacebook: getIt())
  );
  getIt.registerLazySingleton<LoginWithEmailAndPassword>(() => LoginWithEmailAndPassword(getIt()));
  getIt.registerLazySingleton<LoginWithGoogle>(() => LoginWithGoogle(getIt()));
  getIt.registerLazySingleton<LoginWithFacebook>(() => LoginWithFacebook(getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(getIt<LoginRemoteDataSource>()));
  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginAPISource());

  getIt.registerLazySingleton<HomeBloc>(()=>HomeBloc(
      getUserInformation: getIt()
    )
  );
  getIt.registerLazySingleton<GetUserInformation>(()=>GetUserInformation(repository: getIt()));
  getIt.registerLazySingleton<HomeRepository>(()=>HomeRepositoryImpl(remoteSource: getIt<HomeRemoteSource>()));
  getIt.registerLazySingleton<HomeRemoteSource>(() => HomeAPISource());

  getIt.registerLazySingleton<ProfileBloc>(() => ProfileBloc(getIt(), getIt()));
  getIt.registerLazySingleton<GetUserProfile>(() => GetUserProfile(repository: getIt()));
  getIt.registerLazySingleton<UpdateUserProfile>(() => UpdateUserProfile(repository: getIt()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ProfileAPISource>(() => ProfileAPISource());
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
        Constants.routeMain:(_) => MainScreen(),
        Constants.routeLogin:(context) => Login(),
        // Constants.routeProfile:(context) => ProfileScreen(),
        Constants.routeUserInfor:(context) => UserInformation(),
    // '/profile':(context) => ProfileScreen(),
      },
    );
  }
}