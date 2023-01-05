import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/vacancy_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'public_vacancy_event.dart';
part 'public_vacancy_state.dart';

class PublicVacancyBloc extends Bloc<PublicVacancyEvent, PublicVacancyState> {
  PublicVacancyBloc(this._repository) : super(PublicVacancyInitial()) {
    on<PublicVacancyFetchEvent>(_onFetchEvent);
    on<PublicVacancyFetchMoreEvent>(_onFetchMoreEvent);
  }
  final VacancyRepository _repository;
  late List<Vacancy> vacancies;

  Future<void> _onFetchEvent(
    PublicVacancyFetchEvent event,
    Emitter<PublicVacancyState> emit,
  ) async {
    emit(PublicVacancyLoading());
    try {
      vacancies = await _repository.publicVacancies();
      emit(
        PublicVacancyLoaded(
          vacancies: vacancies,
          moreVacancies: vacancies,
        ),
      );
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
      final loadedMoreVacancies = await _repository.publicVacancies(event.page);
      if (state.props.last != loadedMoreVacancies) {
        vacancies += loadedMoreVacancies;
      }
      emit(
        PublicVacancyLoaded(
          vacancies: vacancies,
          moreVacancies: loadedMoreVacancies,
        ),
      );
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
