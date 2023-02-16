part of 'entity_detail_bloc.dart';

abstract class EntityDetailEvent extends Equatable {
  const EntityDetailEvent();

  @override
  List<Object> get props => [];
}

class EntityDetailFetchEvent extends EntityDetailEvent {
  const EntityDetailFetchEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
