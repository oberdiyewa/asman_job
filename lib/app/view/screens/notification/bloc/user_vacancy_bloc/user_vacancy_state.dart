part of 'user_vacancy_bloc.dart';

abstract class UserVacancyState extends Equatable {
  const UserVacancyState();

  @override
  List<Object?> get props => [];
}

class UserVacancyInitial extends UserVacancyState {}

class UserVacancyLoading extends UserVacancyState {}

class UserVacancyLoaded extends UserVacancyState {
  const UserVacancyLoaded({
    required this.vacancies,
    required this.moreVacancies,
  });

  final List<UserVacancy> vacancies;
  final List<UserVacancy> moreVacancies;

  @override
  List<Object?> get props => [vacancies, moreVacancies];
}

class UserVacancyAddSuccess extends UserVacancyState{}

class UserVacancyFailure extends UserVacancyState {
  const UserVacancyFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
