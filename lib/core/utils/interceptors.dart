import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';
import 'package:get_it/get_it.dart';

class LogInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("\n\n\n");
    print("onrequest ${options.method} ${options.path}");
    print(options.data);
    print("=============Request==============");
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("\n\n\n");
    print(err.response?.data);
    print(err.response?.statusCode);
    print("===============FAIL============");
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("\n\n\n");
    print("onresponse ${response.requestOptions.path}");
    print(response.data);
    print(response.statusCode);
    print("=============SUCCESS==============");
    handler.next(response);
  }
}

class AuthenticationInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("AuthenticationInterceptor request");
    // TODO: implement onRequest
    if(GetIt.instance.isRegistered<Session>()) {
      print('insert authorization header');
      options.headers['Authorization'] = "Bearer ${GetIt.instance<Session>().access}";
    }
    handler.next(options);
  }
}

class RefreshTokenInteceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    print("AuthenticationInterceptor error $err");
    // TODO: implement onError
    if(err.response?.requestOptions.path.startsWith("/auth") ?? true) {
      print("reject error");
      handler.reject(err);
    }
    else if(err.response?.statusCode == 401
        && err.response?.data['errorCode'] == 'WRONG_AUTHENTICATION_CREDENTIALS_OR_SESSIONEXPIRED') {
      var dio = GetIt.instance<Dio>();
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();
      RequestOptions options = err.requestOptions;
      await Dio().post(options.baseUrl + "/auth/jwt/refresh/", data: {
        "refresh": GetIt.instance<Session>().refresh
      },options: Options(headers: {
        'Authorization': "Bearer ${GetIt.instance<Session>().access}"
      })).then((value){
        print("Access token expired.");
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        GetIt.instance<Session>().access = value.data['access'];
        var queryParams = options.queryParameters;
        var data = options.data;
        try {
          Dio().request(options.path,queryParameters: queryParams, data: data).then((value){
            handler.resolve(value);
          }).catchError((error){
            handler.reject(error);
          });
        } on DioError catch (e) {
          // TODO
          handler.reject(e);
        }
      }).onError((error, stackTrace){
        print("Refresh token expired");
        dio.clear();
        GetIt.instance<StreamController<bool>>().add(false);
      });
    }
    else handler.reject(err);
  }
}