import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/endpoints.dart';
import 'package:flutter_clean_architecture/data/models/user_model.dart';
import 'package:flutter_clean_architecture/data/models/user_response.dart';
import 'package:flutter_clean_architecture/data/utils/exception.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await dio.get(Endpoints.users);

    if (response.statusCode == 200) {
      final data = response.data;

      return UserResponse.fromJson(data).data;
    } else if (response.statusCode == 400) {
      throw ClientException(response.statusMessage ?? 'Client Exception');
    } else {
      throw ServerException(response.statusMessage ?? 'Server Exception');
    }
  }
}
