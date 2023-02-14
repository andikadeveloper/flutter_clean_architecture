import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/failure.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
}
