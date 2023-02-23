part of 'public_profile_detail_bloc.dart';

abstract class PublicProfileDetailEvent extends Equatable {
  const PublicProfileDetailEvent();
}

class PublicProfileDetailFetchEvent extends PublicProfileDetailEvent {
  const PublicProfileDetailFetchEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
