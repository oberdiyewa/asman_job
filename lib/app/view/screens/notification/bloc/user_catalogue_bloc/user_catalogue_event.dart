part of 'user_catalogue_bloc.dart';

abstract class UserCatalogueEvent extends Equatable {
  const UserCatalogueEvent();

  @override
  List<Object?> get props => [];
}

class UserCatalogueFetchEvent extends UserCatalogueEvent{}
