part of 'vacancy_detail_bloc.dart';

abstract class VacancyDetailEvent extends Equatable {
  const VacancyDetailEvent();

  @override
  List<Object> get props => [];
}

class VacancyDetailFetchEvent extends VacancyDetailEvent {
  const VacancyDetailFetchEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
