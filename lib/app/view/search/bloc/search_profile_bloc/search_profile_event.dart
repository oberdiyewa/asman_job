part of 'search_profile_bloc.dart';

abstract class SearchProfileEvent extends Equatable {
  const SearchProfileEvent();

  @override
  List<Object?> get props => [];
}

class SearchProfileFetchEvent extends SearchProfileEvent {
  const SearchProfileFetchEvent({this.title});
  final String? title;

  @override
  List<Object?> get props => [title];
}

class SearchProfileFetchMoreEvent extends SearchProfileEvent {
  const SearchProfileFetchMoreEvent({this.title});
  final String? title;
}
