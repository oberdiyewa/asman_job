import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_vacancy_event.dart';
part 'search_vacancy_state.dart';

class SearchVacancyBloc extends Bloc<SearchVacancyEvent, SearchVacancyState> {
  SearchVacancyBloc(this._repository) : super(SearchVacancyInitial()) {
    on<SearchVacancyFetchEvent>(_onFetchEvent);
    on<SearchVacancyFetchMoreEvent>(_onFetchMoreEvent);
  }
  final PublicVacancyRepository _repository;

  late List<PublicEntity> searchedVacancies;
  int page = 1;

  Future<void> _onFetchEvent(
    SearchVacancyFetchEvent event,
    Emitter<SearchVacancyState> emit,
  ) async {
    emit(SearchVacancyLoading());
    try {
      page = 1;
      searchedVacancies =
          await _repository.publicVacancies(page: page, forSearch: true);
      emit(
        SearchVacancyLoaded(
          moreVacancies: searchedVacancies,
          searchedVacancies: searchedVacancies,
        ),
      );
      page++;
    } catch (e) {
      searchedVacancies = [];
      emit(
        SearchVacancyFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchMoreEvent(
    SearchVacancyFetchMoreEvent event,
    Emitter<SearchVacancyState> emit,
  ) async {
    if (page <= _repository.searchPage) {
      try {
        final loadedMoreVacancies =
            await _repository.publicVacancies(page: page, forSearch: true);
        if (state.props.last != loadedMoreVacancies) {
          searchedVacancies += loadedMoreVacancies;
        }
        emit(
          SearchVacancyLoaded(
            searchedVacancies: searchedVacancies,
            moreVacancies: loadedMoreVacancies,
          ),
        );
        page++;
      } catch (e) {
        emit(
          SearchVacancyLoaded(
            searchedVacancies: searchedVacancies,
            moreVacancies: const [],
          ),
        );
      }
    }
  }
}
