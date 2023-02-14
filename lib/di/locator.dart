import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerFactory<Dio>(() {
    final dio = Dio();
    final options = BaseOptions();
    final baseUrl = dotenv.env['BASE_URL'] ?? '';

    options.baseUrl = baseUrl;
    options.connectTimeout = const Duration(seconds: 60000);
    options.receiveTimeout = const Duration(seconds: 60000);

    dio.options = options;

    return dio;
  });
}
