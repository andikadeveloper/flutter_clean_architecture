import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/failure.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_users.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsers getUsers;

  UserCubit({required this.getUsers}) : super(UserInitial());

  void fetchUsers() async {
    emit(UserLoading());

    final userResult = await getUsers();

    userResult.fold((failure) {
      emit(UserError(failure: failure));
    }, (users) {
      emit(UserSuccess(users: users));
    });
  }
}
