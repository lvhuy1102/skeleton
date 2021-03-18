
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:skeleton_flutter/net/pretty_dio_logger.dart';

class DioHelper {
  static Dio _dio;
  static int _groupId;

  static Dio get dioObject {
    if (_dio == null) {
      _dio = Dio(BaseOptions(connectTimeout: 30000, receiveTimeout: 30000, sendTimeout: 30000));
      if (kDebugMode) {
        _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: true, error: true, compact: true, maxWidth: 1000));
      } else {
        debugPrint = (String message, {int wrapWidth}) {};
      }
      _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        return options;
      }, onResponse: (Response response) {
        return response; // continue
      }, onError: (DioError error) {
        if (error.response?.statusCode == 401) {
          // _dio.interceptors.requestLock.lock();
          // _dio.interceptors.responseLock.lock();
          // RequestOptions options = error.response.request;
          // await GraphQLHelper.getAccessTokenInRefreshToken(_groupId);
          // updateAccessToken();
          // options.headers['Authorization'] =  TokenManagerHelper.getToken(groupId: _groupId).accessToken;
          // _dio.interceptors.requestLock.unlock();
          // _dio.interceptors.responseLock.unlock();
          // return _dio.request(options.path, options: options);
        } else {
          // return error;
        }
      }));
      _dio.options.headers['Accept-Language'] = 'vi-VN';
      return _dio;
    } else {
      return _dio;
    }
  }

  static set groupIdValue(int value) {
    // _groupId = value;
    // _dio.options.headers['Authorization'] = TokenManagerHelper.getToken(groupId: _groupId).accessToken;
  }

  static updateAccessToken() {
    // final value = TokenManagerHelper.getToken(groupId: _groupId).accessToken;
    // _dio.options.headers['Authorization'] = value;
  }

  static applyLanguage({String language = 'vi-VN'}) {
    // DioHelper.dioObject.options.headers['Accept-Language'] = language;
  }
}
