import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eazifly_student/core/network/api_constances.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';

import 'package:quick_log/quick_log.dart';
import 'package:requests_inspector/requests_inspector.dart';

class NetworkCall {
  final Dio _dio = Dio();

  NetworkCall._() {
    _dio.interceptors.add(RequestsInspectorInterceptor());
  }

  static final _instance = NetworkCall._();

  factory NetworkCall() => _instance;

  Logger logger = const Logger("Dio Logger");

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
      logger.fine("your url is $path");
      logger.fine("your url is ${_dio.options.baseUrl}");
      var tokenFromMemory = TokenUtil.getTokenFromMemory();
      logger.debug(tokenFromMemory);
      var options = Options(
        headers: withHeaders
            ? {
                if (tokenFromMemory.isNotEmpty) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $tokenFromMemory',
                },

                // HttpHeaders.authorizationHeader: tokenFromMemory,
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.acceptLanguageHeader: "ar",
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
      logger.error('Error is : ${e.message}');
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
              HttpHeaders.acceptLanguageHeader: "ar",
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
      logger.debug("token from put  $tokenFromMemory");
    } on DioException catch (e) {
      logger.debug("token from put  $tokenFromMemory");

      logger.error("put error ${e.message}");
      logger.info("put error res ${e.response}");
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
      logger.debug(tokenFromMemory);
      var options = Options(
        headers: withHeaders
            ? {
                if (tokenFromMemory.isNotEmpty) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $tokenFromMemory',
                },
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.acceptLanguageHeader: "ar",
              }
            : headers,
        responseType: responseType,
      );

      response = await _dio.delete(path,
          options: options, queryParameters: queryParameters);
    } on DioException catch (e) {
      logger.error('Error is : ${e.message}');
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
      logger.fine('your url is $path');
      var options = Options(
        headers: withHeaders
            ? {
                if (customizedToken != null) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $customizedToken',
                } else if (tokenFromMemory.isNotEmpty) ...{
                  HttpHeaders.authorizationHeader: 'Bearer $tokenFromMemory',
                },
                HttpHeaders.acceptHeader: 'application/json',
                HttpHeaders.acceptLanguageHeader: "ar",
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
      logger.error(response);
    }

    return response == null ? null : handleResponse(response: response);
  }

  Future<Response?> handleResponse({required Response response}) async {
    logger.fine(
      response.data,
    );
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      await TokenUtil.clearToken();
      navKey.currentState
          ?.pushNamedAndRemoveUntil(RoutePaths.loginPath, (route) => false);
    }
    return response;
  }
}
