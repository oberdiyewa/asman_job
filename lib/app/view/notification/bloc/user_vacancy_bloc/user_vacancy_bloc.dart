import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_vacancy_event.dart';
part 'user_vacancy_state.dart';

class UserVacancyBloc extends Bloc<UserVacancyEvent, UserVacancyState> {
  UserVacancyBloc(this._repository) : super(UserVacancyInitial()) {
    on<UserVacancyFetchEvent>(_onFetchEvent);
    on<UserVacancyFetchMoreEvent>(_onFetchMoreEvent);
  }
  final UserVacancyRepository _repository;

  late List<UserVacancy> vacancies;
  int page = 1;

  Future<void> _onFetchEvent(
    UserVacancyFetchEvent event,
    Emitter<UserVacancyState> emit,
  ) async {
    if (page <= _repository.userVacancyTotalPage) {}
    emit(UserVacancyLoading());
    try {
      vacancies = await _repository.userVacancyList(page: page);
      emit(
        UserVacancyLoaded(
          vacancies: vacancies,
          moreVacancies: vacancies,
        ),
      );
      page++;
    } catch (e) {
      vacancies = [];
      emit(
        UserVacancyFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchMoreEvent(
    UserVacancyFetchMoreEvent event,
    Emitter<UserVacancyState> emit,
  ) async {
    if (page <= _repository.userVacancyTotalPage) {
      try {
        final loadedMoreVacancies =
            await _repository.userVacancyList(page: page);
        if (state.props.last != loadedMoreVacancies) {
          vacancies += loadedMoreVacancies;
        }
        emit(
          UserVacancyLoaded(
            vacancies: vacancies,
            moreVacancies: loadedMoreVacancies,
          ),
        );
        page++;
      } catch (e) {
        emit(
          UserVacancyLoaded(
            vacancies: vacancies,
            moreVacancies: const [],
          ),
        );
      }
    }
  }
}
