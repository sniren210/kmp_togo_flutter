import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:kmp_togo_mobile/helpers/user_database_helper.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;
import 'package:jwt_decoder/jwt_decoder.dart';

class Helper {
  // Singleton
  Helper._internal();
  static final Helper _helper = Helper._internal();
  factory Helper() => _helper;

  // final _baseUrl = 'https://digitogo.tech';
  // final _baseUrl = 'http://147.139.168.187:3000';
  // final _baseUrl = 'https://api.digitogo.tech';
  final _baseUrl = 'https://admin.digitogo.tech';

  late Dio _dio;
  Dio get dio => _dio;

  Future<void> init() async {
    final dir = await pathProvider.getApplicationDocumentsDirectory();
    final pathCookie = path.join(dir.path, '.cookies');

    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 15 * 1000, // 15 seconds
      receiveTimeout: 10 * 1000, // 10 seconds
      contentType: Headers.formUrlEncodedContentType,
      // headers: {'Accept': 'application/json'},
    ));
    _dio.interceptors.add(
      CookieManager(
        PersistCookieJar(
          storage: FileStorage(pathCookie),
        ),
      ),
    );
    _dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        final user = await UserHelper.getUser();

        if (user != null) {
          if (JwtDecoder.isExpired(user.token)) {
            // auto logout
          }
          options.headers['authorization'] = 'Bearer ${user.token}';
        }
        handler.next(options);
      },
    ));

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }
}

class Error {
  String message;

  Error(this.message);
}
