part of 'public_vacancy_detail_bloc.dart';

abstract class PublicVacancyDetailEvent extends Equatable {
  const PublicVacancyDetailEvent();

  @override
  List<Object?> get props => [];
}

class PublicVacancyDetailFetchEvent extends PublicVacancyDetailEvent {
  const PublicVacancyDetailFetchEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
