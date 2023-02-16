part of 'entity_detail_bloc.dart';

abstract class EntityDetailState extends Equatable {
  const EntityDetailState();

  @override
  List<Object> get props => [];
}

class EntityDetailInitial extends EntityDetailState {}

class EntityDetailLoading extends EntityDetailState {}

class EntityDetailLoaded extends EntityDetailState {
  const EntityDetailLoaded(this.entityDetail);

  final VacancyDetail entityDetail;

  @override
  List<Object> get props => [entityDetail];
}

class EntityDetailFailure extends EntityDetailState {
  const EntityDetailFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
