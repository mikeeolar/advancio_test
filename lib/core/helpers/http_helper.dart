import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:advancio_test/core/base/session_services.dart';

class HttpHelper {
  static Dio? _client;

  /// [Development] - Show logs of API calls. For [development] only use
  // static Future<Dio> _getInstance([bool enabledDioLogger = true]) async {
  //   final String storageToken =
  //       SessionService.getAuthToken(defaultToken: 'null');
  //   _client ??= Dio();
  //   Map<String, dynamic> headers = {};
  //   headers['Content-Type'] = 'application/json';
  //   headers['Accept'] = 'application/json';
  //   if (storageToken != 'null') {
  //     headers['Authorization'] = 'Bearer $storageToken';
  //   }

  //   _client!.options.headers = headers;

  //   _client!.interceptors.add(
  //     DioCacheManager(
  //       CacheConfig(
  //         baseUrl: AppConstants.kBaseUrl,
  //         defaultMaxAge: const Duration(days: 14),
  //       ),
  //     ).interceptor,
  //   );

  //   if (enabledDioLogger) {
  //     _client!.interceptors.add(
  //       PrettyDioLogger(
  //         requestHeader: true,
  //         requestBody: true,
  //         responseBody: true,
  //         responseHeader: false,
  //         error: true,
  //         compact: true,
  //         maxWidth: 400,
  //       ),
  //     );
  //   }
  //   return _client!;
  // }

  /// [Production] - API Calls
  static Future<Dio> _getInstance() async {
    final String storageToken =
        SessionService.getAuthToken(defaultToken: 'null');
    _client ??= Dio();
    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    if (storageToken != 'null') {
      headers['Authorization'] = 'Bearer $storageToken';
    }

    _client!.options.headers = headers;

    _client!.interceptors.add(
      DioCacheManager(
        CacheConfig(
          baseUrl: 'https://rennersapi.com/api/',
          defaultMaxAge: const Duration(days: 14),
        ),
      ).interceptor,
    );
    return _client!;
  }

  /// [GET] API calls
  Future<Response> get(String url, {Options? options}) async {
    final instance = await _getInstance();
    return instance.get(url, options: options);
  }

  /// [DOWNLOAD] API call
  Future<Response> download(String url, String savePath,
      {ProgressCallback? progressCallback}) async {
    final instance = await _getInstance();
    return instance.download(url, savePath,
        onReceiveProgress: progressCallback);
  }

  /// [POST] API Calls
  Future<Response> post(
    String url, {
    dynamic body,
    Options? options,
    ProgressCallback? progressCallback,
  }) async {
    final instance = await _getInstance();
    return instance.post(
      url,
      data: body,
      onSendProgress: progressCallback,
      options: options,
    );
  }

  /// [POSTURI] API Calls
  Future<Response> postUri(
    Uri uri, {
    dynamic body,
    Options? options,
    ProgressCallback? progressCallback,
  }) async {
    final instance = await _getInstance();
    return instance.postUri(uri,
        data: body, onSendProgress: progressCallback, options: options);
  }

  /// [PUTURI] API Calls
  Future<Response> putUri(
    Uri uri, {
    dynamic body,
    Options? options,
    ProgressCallback? progressCallback,
  }) async {
    final instance = await _getInstance();
    return instance.putUri(uri,
        data: body, onSendProgress: progressCallback, options: options);
  }

  /// [PATCH] API Calls
  Future<Response> patch(
    String url, {
    dynamic body,
    Options? options,
    ProgressCallback? progressCallback,
  }) async {
    final instance = await _getInstance();
    return instance.patch(url,
        data: body, onSendProgress: progressCallback, options: options);
  }

  /// [PUT] API Calls
  Future<Response> put(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.put(url, data: body);
  }

  /// [DELETE] API Calls
  Future<Response> delete(String url, {dynamic body}) async {
    final instance = await _getInstance();
    return instance.delete(url, data: body);
  }
}
