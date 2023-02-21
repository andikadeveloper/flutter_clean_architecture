part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;

  const UserSuccess({required this.users});
}

class UserError extends UserState {
  final Failure failure;

  const UserError({required this.failure});
}
