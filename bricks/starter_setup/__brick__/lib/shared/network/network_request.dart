import 'dart:developer';

import 'package:dio/dio.dart';
import '../../generated/l10n.dart';
import 'interceptors.dart';

class HttpService {
  Dio? _dio;
  final String baseUrl;
  final bool hasAuthorization;
  final bool isFormType;

  HttpService(
      {required this.baseUrl,
      this.hasAuthorization = false,
      this.isFormType = false}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 25000,
    ));
    _interceptorsInit();
  }
  static const int timeoutDuration = 1;

  Future<Response> getRequest(
    urlEndPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;

    response = await _dio!
        .get(urlEndPoint, queryParameters: queryParameters)
        .timeout(const Duration(minutes: timeoutDuration));
    return response;
  }

  Future<Response> post(
    urlEndpoint, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;

    response = await _dio!
        .post(urlEndpoint, data: data, queryParameters: queryParameters)
        .timeout(const Duration(minutes: timeoutDuration));
    return response;
  }

  Future<Response> put(urlEndpoint,
      {data, Map<String, dynamic>? queryParameters}) async {
    Response response;

    response = await _dio!
        .put(urlEndpoint, data: data, queryParameters: queryParameters)
        .timeout(const Duration(minutes: timeoutDuration));

    return response;
  }

  Future<Response> delete(urlEndpoint,
      {data, Map<String, dynamic>? queryParameters}) async {
    Response response;

    response = await _dio!
        .delete(urlEndpoint, data: data, queryParameters: queryParameters)
        .timeout(const Duration(minutes: timeoutDuration));

    return response;
  }

  Future<Response> patch(urlEndpoint,
      {data, Map<String, dynamic>? queryParameters}) async {
    Response response;

    response = await _dio!
        .patch(urlEndpoint, data: data, queryParameters: queryParameters)
        .timeout(const Duration(minutes: timeoutDuration));

    return response;
  }

  _interceptorsInit() {
    _dio!.interceptors.add(HeaderInterceptor(
        hasToken: hasAuthorization,
        dio: _dio!,
        contentType: isFormType
            ? HeaderContentType.formType
            : HeaderContentType.jsonType));
  }
}

extension ResponseExt on Response {
  bool get isSuccessful => statusCode! >= 200 && statusCode! < 300;
  get body => data;
}

String errorDefaultMessage = S.current.anErrorOccurred;
// Error Handler Function
String networkErrorHandler(DioError error,
    {Function(DioError e)? onResponseError}) {
  switch (error.type) {
    case DioErrorType.response:
      if (onResponseError == null && error.response != null) {
        if (error.response?.statusCode == 500) {
          return errorDefaultMessage;
        }
        return error.response?.data["message"];
      }
      return onResponseError!(error);
    case DioErrorType.connectTimeout:
      return S.current.kindlyTryAgain;
    case DioErrorType.sendTimeout:
      return S.current.kindlyTryAgain;
    case DioErrorType.receiveTimeout:
      return S.current.kindlyTryAgain;
    case DioErrorType.cancel:
      return S.current.requestCancelled;
    case DioErrorType.other:
      return S.current.noInternetConnection;
    default:
      return errorDefaultMessage;
  }
}
