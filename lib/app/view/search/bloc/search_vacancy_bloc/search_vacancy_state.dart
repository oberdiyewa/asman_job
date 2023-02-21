part of 'search_vacancy_bloc.dart';

abstract class SearchVacancyState extends Equatable {
  const SearchVacancyState();
  @override
  List<Object?> get props => [];
}

class SearchVacancyInitial extends SearchVacancyState {}

class SearchVacancyLoading extends SearchVacancyState {}

class SearchVacancyLoaded extends SearchVacancyState {
  const SearchVacancyLoaded({
    required this.moreVacancies,
    required this.searchedVacancies,
  });
  final List<PublicEntity> moreVacancies;
  final List<PublicEntity> searchedVacancies;

  @override
  List<Object> get props => [moreVacancies, searchedVacancies];
}

class SearchVacancyFailure extends SearchVacancyState {
  const SearchVacancyFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
