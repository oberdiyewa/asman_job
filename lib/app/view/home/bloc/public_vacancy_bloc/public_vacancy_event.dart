part of 'public_vacancy_bloc.dart';

abstract class PublicVacancyEvent extends Equatable {
  const PublicVacancyEvent();

  @override
  List<Object> get props => [];
}

class PublicVacancyFetchEvent extends PublicVacancyEvent {}

class PublicVacancyFetchMoreEvent extends PublicVacancyEvent {
  const PublicVacancyFetchMoreEvent();
}
