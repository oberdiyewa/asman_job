part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserFetchedSuccess extends UserState {

  UserFetchedSuccess(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class UserFailure extends UserState {

  UserFailure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [];
}
