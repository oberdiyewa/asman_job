part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

class UserProfileFetchEvent extends UserProfileEvent {}

class UserProfileFetchMoreEvent extends UserProfileEvent {}


class UserProfileAddEvent extends UserProfileEvent {
  const UserProfileAddEvent(this.data);

  final Map<String, dynamic> data;

  @override
  List<Object?> get props => [data];
}

class UserProfileUpdateEvent extends UserProfileEvent {
  const UserProfileUpdateEvent(this.data, this.id);

  final Map<String, dynamic> data;
  final int id;

  @override
  List<Object?> get props => [data, id];
} 

class UserProfileDeleteEvent extends UserProfileEvent {
  const UserProfileDeleteEvent(this.id);
  final int id;

  @override
  List<Object?> get props => [id];
}
