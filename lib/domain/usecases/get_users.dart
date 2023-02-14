import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/failure.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository userRepository;

  GetUsers({required this.userRepository});

  Future<Either<Failure, List<User>>> call() {
    return userRepository.getUsers();
  }
}
