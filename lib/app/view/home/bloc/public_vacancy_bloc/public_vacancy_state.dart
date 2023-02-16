part of 'public_vacancy_bloc.dart';

abstract class PublicVacancyState extends Equatable {
  const PublicVacancyState();

  @override
  List<Object> get props => [];
}

class PublicVacancyInitial extends PublicVacancyState {}

class PublicVacancyLoading extends PublicVacancyState {}

class PublicVacancyLoaded extends PublicVacancyState {
  const PublicVacancyLoaded(
      {required this.vacancies, required this.moreVacancies,});

  final List<Vacancy> vacancies;
  final List<Vacancy> moreVacancies;

  @override
  List<Object> get props => [vacancies, moreVacancies];
}

class PublicVacancyFailure extends PublicVacancyState {
  const PublicVacancyFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
