part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  const UserProfileLoaded({
    required this.profiles,
    required this.moreProfiles,
  });

  final List<PublicProfileDetail> profiles;
  final List<PublicProfileDetail> moreProfiles;

  @override
  List<Object?> get props => [profiles, moreProfiles];
}

class UserProfileFailure extends UserProfileState {
  const UserProfileFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
