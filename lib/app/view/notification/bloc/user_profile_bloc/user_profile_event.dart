part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

class UserProfileFetchEvent extends UserProfileEvent {}

class UserProfileFetchMoreEvent extends UserProfileEvent {}

class UserProfileDeleteEvent extends UserProfileEvent {

  const UserProfileDeleteEvent(this.id);
  final int id;

  @override
  List<Object?> get props => [id];
}
