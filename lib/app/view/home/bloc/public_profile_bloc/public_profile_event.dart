part of 'public_profile_bloc.dart';

abstract class PublicProfileEvent extends Equatable {
  const PublicProfileEvent();

  @override
  List<Object?> get props => [];
}

class PublicProfileFetchEvent extends PublicProfileEvent {
  const PublicProfileFetchEvent({this.title});

  final String? title;

  @override
  List<Object?> get props => [title];
}

class PublicProfileFetchMoreEvent extends PublicProfileEvent {
  const PublicProfileFetchMoreEvent({this.title});
  final String? title;

  @override
  List<Object?> get props => [title];
}
