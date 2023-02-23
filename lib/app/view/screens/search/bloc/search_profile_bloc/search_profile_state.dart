part of 'search_profile_bloc.dart';

abstract class SearchProfileState extends Equatable {
  const SearchProfileState();

  @override
  List<Object?> get props => [];
}

class SearchProfileInitial extends SearchProfileState {}

class SearchProfileLoading extends SearchProfileState {}

class SearchProfileLoaded extends SearchProfileState {
  const SearchProfileLoaded({
    required this.moreProfiles,
    required this.searchedProfiles,
  });
  final List<PublicEntity> moreProfiles;
  final List<PublicEntity> searchedProfiles;

  @override
  List<Object> get props => [moreProfiles, searchedProfiles];
}

class SearchProfileFailure extends SearchProfileState {
  const SearchProfileFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
