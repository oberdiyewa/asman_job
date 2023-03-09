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
    on<UserVacancyAddEvent>(_onAddEvent);
    on<UserVacancyUpdateEvent>(_onUpdateEvent);
    on<UserVacancyDeleteEvent>(_onDeleteEvent);
  }
  final UserVacancyRepository _repository;

  late List<UserVacancy> vacancies;
  int page = 1;

  Future<void> _onFetchEvent(
    UserVacancyFetchEvent event,
    Emitter<UserVacancyState> emit,
  ) async {
    page = 1;
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

  Future<void> _onAddEvent(
    UserVacancyAddEvent event,
    Emitter<UserVacancyState> emit,
  ) async {
    try {
      emit(UserVacancyLoading());
      await _repository.userVacancyAdd(event.data);
      emit(UserVacancyAddSuccess());
      add(UserVacancyFetchEvent());
    } catch (e) {
      emit(
        UserVacancyFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onUpdateEvent(
    UserVacancyUpdateEvent event,
    Emitter<UserVacancyState> emit,
  ) async {
    // final Vacancys = (state as UserVacancyLoaded).vacancies;
    try {
      emit(UserVacancyLoading());
      await _repository.userVacancyUpdate(event.data, event.id);
      emit(UserVacancyAddSuccess());
      add(UserVacancyFetchEvent());
    } catch (e) {
      emit(
        UserVacancyFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteEvent(
    UserVacancyDeleteEvent event,
    Emitter<UserVacancyState> emit,
  ) async {
    final vacancies = (state as UserVacancyLoaded).vacancies;
    print(vacancies.length);
    try {
      emit(UserVacancyLoading());
      final response = await _repository.userVacancyDelete(event.id);
      if (response) {
        final updatedVacancyList =
            vacancies.where((e) => e.id != event.id).toList();
        emit(
          UserVacancyLoaded(
            vacancies: updatedVacancyList,
            moreVacancies: const [],
          ),
        );
      } else {
        emit(
          UserVacancyLoaded(
            vacancies: vacancies,
            moreVacancies: const [],
          ),
        );
      }
    } catch (e) {
      emit(
        UserVacancyFailure(
          e.toString(),
        ),
      );
    }
  }
}
