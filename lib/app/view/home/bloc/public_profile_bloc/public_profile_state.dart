part of 'public_profile_bloc.dart';

abstract class PublicProfileState extends Equatable {
  const PublicProfileState();

  @override
  List<Object> get props => [];
}

class PublicProfileInitial extends PublicProfileState {}

class PublicProfileLoading extends PublicProfileState {}

class PublicProfileLoaded extends PublicProfileState {
  const PublicProfileLoaded({
    required this.profiles,
    required this.moreProfiles,
  });

  final List<PublicEntity> profiles;
  final List<PublicEntity> moreProfiles;

  @override
  List<Object> get props => [profiles, moreProfiles];
}

class PublicProfileFailure extends PublicProfileState {
  const PublicProfileFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
