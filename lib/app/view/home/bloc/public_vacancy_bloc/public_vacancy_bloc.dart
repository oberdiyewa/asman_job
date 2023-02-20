import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/vacancy_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'public_vacancy_event.dart';
part 'public_vacancy_state.dart';

class PublicVacancyBloc extends Bloc<PublicVacancyEvent, PublicVacancyState> {
  PublicVacancyBloc(this._repository) : super(PublicVacancyInitial()) {
    on<PublicVacancyFetchEvent>(_onFetchEvent);
    on<PublicVacancyFetchMoreEvent>(_onFetchMoreEvent);
  }
  final VacancyRepository _repository;

  late List<Vacancy> vacancies;
  int page = 1;

  Future<void> _onFetchEvent(
    PublicVacancyFetchEvent event,
    Emitter<PublicVacancyState> emit,
  ) async {
    emit(PublicVacancyLoading());
    try {
      vacancies = await _repository.publicVacancies(page: page);
      emit(
        PublicVacancyLoaded(
          vacancies: vacancies,
          moreVacancies: vacancies,
        ),
      );
      page++;
    } catch (e) {
      vacancies = [];
      emit(
        PublicVacancyFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchMoreEvent(
    PublicVacancyFetchMoreEvent event,
    Emitter<PublicVacancyState> emit,
  ) async {
    try {
      final loadedMoreVacancies = await _repository.publicVacancies(page: page);
      if (state.props.last != loadedMoreVacancies) {
        vacancies += loadedMoreVacancies;
      }
      emit(
        PublicVacancyLoaded(
          vacancies: vacancies,
          moreVacancies: loadedMoreVacancies,
        ),
      );
      page++;
    } catch (e) {
      emit(
        PublicVacancyLoaded(
          vacancies: vacancies,
          moreVacancies: const [],
        ),
      );
    }
  }
}
