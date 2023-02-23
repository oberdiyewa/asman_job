// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_vacancy_bloc.dart';

abstract class UserVacancyEvent extends Equatable {
  const UserVacancyEvent();
  @override
  List<Object?> get props => [];
}

class UserVacancyFetchEvent extends UserVacancyEvent {}

class UserVacancyFetchMoreEvent extends UserVacancyEvent {}
