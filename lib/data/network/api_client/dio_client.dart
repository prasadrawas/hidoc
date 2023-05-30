import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hidoc/data/network/handle_error.dart';

import '../../../../model/result/result.dart';

class DioClient {
  final Dio _dio = Dio();
  // final String apiKey;
  final String baseUrl;
  DioClient({/*required this.apiKey,*/ required this.baseUrl}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        // 'authorization': 'Bearer $apiKey'
      },
    );
    _dio.options = options;
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: true));
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<Result<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio
        .get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    )
        .onError(
      (error, stackTrace) async {
        throw Exception(handleError(error, stackTrace));
      },
    );

    return _handleResponse(response);
  }

  // Post:----------------------------------------------------------------------
  Future<Result<dynamic>> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio
        .post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .onError(
      (error, stackTrace) async {
        throw Exception(handleError(error, stackTrace));
      },
    );

    return _handleResponse(response);
  }

  // PUT:----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio
        .put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .onError(
      (error, stackTrace) async {
        throw Exception(handleError(error, stackTrace));
      },
    );

    return _handleResponse(response);
    ;
  }

  //Handle Response
  Future<Result<dynamic>> _handleResponse(
    Response response,
  ) async {
    switch (response.statusCode) {
      case 100:
        return Result(error: 'Continue');
      case 101:
        return Result(error: 'Switching Protocols');
      case 102:
        return Result(error: 'Processing');
      case 200:
      case 201:
        return Result(data: response.data);
      case 400:
        return Result(error: 'Bad request');
      case 401:
        return Result(error: 'Unauthorized');
      case 403:
        return Result(error: 'Forbidden');
      case 404:
        return Result(error: 'Not found');
      case 408:
        return Result(error: 'Request timeout');
      case 500:
        return Result(error: 'Internal server error');
      case 502:
        return Result(error: 'Bad gateway');
      case 503:
        return Result(error: 'Service unavailable');
      case 504:
        return Result(error: 'Gateway timeout');
      default:
        return Result(error: 'Unknown error occurred');
    }
  }
}
