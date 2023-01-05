part of 'vacancy_detail_bloc.dart';

abstract class VacancyDetailState extends Equatable {
  const VacancyDetailState();

  @override
  List<Object> get props => [];
}

class VacancyDetailInitial extends VacancyDetailState {}

class VacancyDetailLoading extends VacancyDetailState {}

class VacancyDetailLoaded extends VacancyDetailState {
  const VacancyDetailLoaded(this.vacancyDetail);

  final Vacancy vacancyDetail;

  @override
  List<Object> get props => [vacancyDetail];
}

class VacancyDetailFailure extends VacancyDetailState {
  const VacancyDetailFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
