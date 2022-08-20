import 'package:dio/dio.dart';

import '../utils/storage.dart';

enum HeaderContentType { formType, jsonType }

class HeaderInterceptor extends Interceptor {
  final bool hasToken;
  final HeaderContentType contentType;
  final Dio dio;

  HeaderInterceptor({
    required this.hasToken,
    this.contentType = HeaderContentType.jsonType,
    required this.dio,
  });

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (hasToken) {
      var token = "Bearer ${await UserTokenManager.getAccessToken()}";

      options.headers["Authorization"] = token;
    }
    options.headers["Content-Type"] = contentType == HeaderContentType.jsonType
        ? "application/json"
        : "multipart/form-data";
    return super.onRequest(options, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      // _redirectToLoginScreen();
    }
    super.onError(err, handler);
  }
}
