import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/datasources/user_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_users.dart';
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

  // Usecase
  locator.registerLazySingleton<GetUsers>(
    () => GetUsers(userRepository: locator.get()),
  );

  // Repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSource: locator.get()),
  );

  // Data source
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: locator.get()),
  );
}
