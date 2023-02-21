part of 'public_vacancy_detail_bloc.dart';

abstract class PublicVacancyDetailState extends Equatable {
  const PublicVacancyDetailState();

  @override
  List<Object> get props => [];
}

class PublicVacancyDetailInitial extends PublicVacancyDetailState {}

class PublicVacancyDetailLoading extends PublicVacancyDetailState {}

class PublicVacancyDetailLoaded extends PublicVacancyDetailState {
  const PublicVacancyDetailLoaded(this.publicVacancyDetail);

  final PublicVacancyDetail publicVacancyDetail;

  @override
  List<Object> get props => [publicVacancyDetail];
}

class PublicVacancyDetailFailure extends PublicVacancyDetailState {
  const PublicVacancyDetailFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
