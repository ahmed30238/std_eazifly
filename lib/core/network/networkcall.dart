import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eazifly_student/core/network/api_constances.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';
import 'package:get_storage/get_storage.dart';

import 'package:requests_inspector/requests_inspector.dart';

import '../enums/storage_enum.dart';

class NetworkCall {
  final Dio _dio = Dio();

  NetworkCall._() {
    _dio.interceptors.add(RequestsInspectorInterceptor());
  }

  static final _instance = NetworkCall._();

  factory NetworkCall() => _instance;

  // log const logDio log

  Future<Response?> get({
    required String path,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
    
    bool withHeaders = true,
  }) async {
    Response? response;
    try {
      _dio.options.baseUrl = ApiConstance.apiUrl;
      log("your url is $path");
      log("your url is ${_dio.options.baseUrl}");
      var tokenFromMemory = TokenUtil.getTokenFromMemory();
      log(tokenFromMemory);
      var options = Options(
        headers: withHeaders
            ? {
                if (tokenFromMemory.isNotEmpty) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $tokenFromMemory',
                },

                // HttpHeaders.authorizationHeader: tokenFromMemory,
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.acceptLanguageHeader:
                GetStorage().hasData(StorageEnum.lang.name)
                    ? GetStorage().read(StorageEnum.lang.name)
                    : "ar",
              }
            : headers,
        responseType: responseType,
      );

      response = await _dio.get(
        path,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      log('Error is : ${e.message}');
      response = e.response;
    }
    return response == null ? null : handleResponse(response: response);
  }

  Future<Response?> put({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? contentType,
    bool withHeaders = true,
  }) async {
    Response? response;
    _dio.options.baseUrl = ApiConstance.apiUrl;
    var tokenFromMemory = TokenUtil.getTokenFromMemory();
    var options = Options(
      headers: withHeaders
          ? {
              if (tokenFromMemory.isNotEmpty) ...{
                HttpHeaders.authorizationHeader: "Bearer $tokenFromMemory",
              },
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.acceptLanguageHeader:
              GetStorage().hasData(StorageEnum.lang.name)
                  ? GetStorage().read(StorageEnum.lang.name)
                  : "ar",
            }
          : headers,
      contentType: contentType ?? Headers.formUrlEncodedContentType,
    );
    try {
      response = await _dio.put(
        path,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      log("token from put  $tokenFromMemory");
    } on DioException catch (e) {
      log("token from put  $tokenFromMemory");

      log("put error ${e.message}");
      log("put error res ${e.response}");
      response = e.response;
    }
    return response == null ? null : handleResponse(response: response);
  }

  Future<Response?> delete({
    required String path,
    bool isGeneralApi = false,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
    bool withHeaders = true,
    bool useBaseUrl = true,
  }) async {
    Response? response;
    try {
      if (useBaseUrl) {
        _dio.options.baseUrl = ApiConstance.apiUrl;
      }
      var tokenFromMemory = TokenUtil.getTokenFromMemory();
      log(tokenFromMemory);
      var options = Options(
        headers: withHeaders
            ? {
                if (tokenFromMemory.isNotEmpty) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $tokenFromMemory',
                },
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.acceptLanguageHeader:
                GetStorage().hasData(StorageEnum.lang.name)
                    ? GetStorage().read(StorageEnum.lang.name)
                    : "ar",
              }
            : headers,
        responseType: responseType,
      );

      response = await _dio.delete(path,
          options: options, queryParameters: queryParameters);
    } on DioException catch (e) {
      log('Error is : ${e.message}');
      response = e.response;
    }
    return response == null ? null : handleResponse(response: response);
  }

  Future<Response?> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
    String? customizedToken,
    bool withHeaders = true,
    ResponseType? responseType,
    bool isMultipart = false,
  }) async {
    Response? response;
    _dio.options.baseUrl = ApiConstance.apiUrl;
    var tokenFromMemory = TokenUtil.getTokenFromMemory();
    try {
      log('your url is $path');
      var options = Options(
        headers: withHeaders
            ? {
                if (customizedToken != null) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $customizedToken',
                } else if (tokenFromMemory.isNotEmpty) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $tokenFromMemory',
                },
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.acceptLanguageHeader:
                GetStorage().hasData(StorageEnum.lang.name)
                    ? GetStorage().read(StorageEnum.lang.name)
                    : "ar",
                if (!isMultipart)
                  HttpHeaders.contentTypeHeader: 'application/json',
              }
            : headers,
        responseType: responseType,
      );

      response = await _dio.post(
        path,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      response = e.response;
      log("$response");
    }

    return response == null ? null : handleResponse(response: response);
  }

  Future<Response?> handleResponse({required Response response}) async {
    log("${response.data}");
    
    // التحقق من الـ HTTP status code الأساسي
    if (response.statusCode == 200) {
      // التحقق من الـ status اللي جوا الـ response body
      if (response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        final innerStatus = responseData['status'];
        
        // لو الـ status جوا الـ response هو 401، يبقى المستخدم مش مصرح له
        if (innerStatus == 401) {
          log('Unauthenticated user detected from response body');
          await TokenUtil.clearToken();
          navKey.currentState
              ?.pushNamedAndRemoveUntil(RoutePaths.loginPath, (route) => false);
          return response; // أو ممكن ترجع null حسب احتياجك
        }
      }
      
      return response;
    } else if (response.statusCode == 401) {
      // التعامل مع الـ HTTP 401 العادي
      await TokenUtil.clearToken();
      navKey.currentState
          ?.pushNamedAndRemoveUntil(RoutePaths.loginPath, (route) => false);
    }
    
    return response;
  }
}