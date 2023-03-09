part of 'user_vacancy_bloc.dart';

abstract class UserVacancyEvent extends Equatable {
  const UserVacancyEvent();

  @override
  List<Object?> get props => [];
}

class UserVacancyFetchEvent extends UserVacancyEvent {}

class UserVacancyFetchMoreEvent extends UserVacancyEvent {}

class UserVacancyAddEvent extends UserVacancyEvent {
  const UserVacancyAddEvent(this.data);

  final Map<String, dynamic> data;

  @override
  List<Object?> get props => [data];
}

class UserVacancyUpdateEvent extends UserVacancyEvent {
  const UserVacancyUpdateEvent(this.data, this.id);

  final Map<String, dynamic> data;
  final int id;

  @override
  List<Object?> get props => [data, id];
}

class UserVacancyDeleteEvent extends UserVacancyEvent {
  const UserVacancyDeleteEvent(this.id);
  final int id;

  @override
  List<Object?> get props => [id];
}
