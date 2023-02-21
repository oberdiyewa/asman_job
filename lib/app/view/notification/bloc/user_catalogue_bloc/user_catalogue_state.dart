part of 'user_catalogue_bloc.dart';

abstract class UserCatalogueState extends Equatable {
  const UserCatalogueState();
  @override
  List<Object?> get props => [];
}

class UserCatalogueInitial extends UserCatalogueState {}

class UserCatalogueLoading extends UserCatalogueState {}

class UserCatalogueLoaded extends UserCatalogueState {

  const UserCatalogueLoaded({
    required this.educationTypes,
    required this.employmentTypes,
    required this.industries,
    required this.languages,
  });
  final List<CatalogueEducationType> educationTypes;
  final List<CatalogueEmploymentType> employmentTypes;
  final List<CatalogueIndustry> industries;
  final List<CatalogueLanguage> languages;

  @override
  List<Object?> get props => [
        educationTypes,
        employmentTypes,
        industries,
        languages,
      ];
}

class UserCatalogueFailure extends UserCatalogueState {

  const UserCatalogueFailure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
