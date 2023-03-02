part of 'public_profile_detail_bloc.dart';

abstract class PublicProfileDetailState extends Equatable {
  const PublicProfileDetailState();

  @override
  List<Object> get props => [];
}

class PublicProfileDetailInitial extends PublicProfileDetailState {}

class PublicProfileDetailLoading extends PublicProfileDetailState {}

class PublicProfileDetailLoaded extends PublicProfileDetailState {
  const PublicProfileDetailLoaded(this.publicProfileDetail);

  final Profile publicProfileDetail;

  @override
  List<Object> get props => [publicProfileDetail];
}

class PublicProfileDetailFailure extends PublicProfileDetailState {
  const PublicProfileDetailFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
