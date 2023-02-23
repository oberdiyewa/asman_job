part of 'search_vacancy_bloc.dart';

abstract class SearchVacancyEvent extends Equatable {
  const SearchVacancyEvent();

  @override
  List<Object?> get props => [];
}

class SearchVacancyFetchEvent extends SearchVacancyEvent {
  const SearchVacancyFetchEvent({this.title});
  final String? title;

  @override
  List<Object?> get props => [title];
}

class SearchVacancyFetchMoreEvent extends SearchVacancyEvent {
  const SearchVacancyFetchMoreEvent({this.title});
  final String? title;
}
