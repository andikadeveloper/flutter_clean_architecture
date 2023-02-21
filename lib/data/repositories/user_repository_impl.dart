import 'dart:io';

import 'package:flutter_clean_architecture/data/datasources/user_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/utils/exception.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final result = await userRemoteDataSource.getUsers();
      final users = result.map((user) => user.toEntity()).toList();

      return Right(users);
    } on ClientException catch (e) {
      return Left(ClientFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.message));
    }
  }
}
