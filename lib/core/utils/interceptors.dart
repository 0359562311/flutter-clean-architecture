import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_clean_architecture/app/data/models/session_model.dart';
import 'package:flutter_app_clean_architecture/app/domain/entities/session.dart';
import 'package:get_it/get_it.dart';

class AuthenticationInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    if (GetIt.instance.isRegistered<Session>()) {
      options.headers['Authorization'] =
          "Bearer ${GetIt.instance<Session>().access}";
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    // TODO: implement onError
    if (err.response?.requestOptions.path.startsWith("/auth") ?? true) {
      handler.next(err);
    } else if (err.response?.statusCode == 401
        // && err.response?.data['errorCode'] == 'WRONG_AUTHENTICATION_CREDENTIALS_OR_SESSIONEXPIRED'
        ) {
      var dio = GetIt.instance<Dio>();
      dio.interceptors.requestLock.lock();
      RequestOptions options = err.requestOptions;
      await Dio()
          .post(options.baseUrl + "/auth/jwt/refresh/",
              data: {"refresh": GetIt.instance<Session>().refresh},
              options: Options(headers: {
                'Authorization': "Bearer ${GetIt.instance<Session>().access}"
              }))
          .then((value) async {
        dio.interceptors.requestLock.unlock();
        if(GetIt.instance.isRegistered<Session>())
          GetIt.instance.unregister<Session>();
        GetIt.instance.registerSingleton<Session>(SessionModel.fromResponse(value));
        var queryParams = options.queryParameters;
        var data = options.data;
        await Dio()
            .request(options.baseUrl + options.path,
                queryParameters: queryParams,
                data: data,
                options: Options(headers: {
                  'Authorization': "Bearer ${GetIt.instance<Session>().access}"
                }, method: options.method))
            .then((value) {
          print("value from interceptor $value");
          handler.resolve(value);
        }).catchError((error) {
          handler.reject(error);
        });
      }).catchError((error) {
        print("Refresh token expired");
        dio.clear();
        handler.next(error);
        // GetIt.instance<StreamController<bool>>().add(false);
      });
    } else
      handler.reject(err);
  }
}
