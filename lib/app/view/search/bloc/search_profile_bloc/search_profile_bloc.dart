import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_profile_event.dart';
part 'search_profile_state.dart';

class SearchProfileBloc extends Bloc<SearchProfileEvent, SearchProfileState> {
  SearchProfileBloc(this._repository) : super(SearchProfileInitial()) {
    on<SearchProfileFetchEvent>(_onFetchEvent);
    on<SearchProfileFetchMoreEvent>(_onFetchMoreEvent);
  }
  final PublicProfileRepository _repository;

  late List<PublicEntity> searchedProfiles;
  int page = 1;

  Future<void> _onFetchEvent(
    SearchProfileFetchEvent event,
    Emitter<SearchProfileState> emit,
  ) async {
    emit(SearchProfileLoading());
    try {
      page = 1;
      searchedProfiles =
          await _repository.publicProfiles(page: page, forSearch: true);
      emit(
        // ignore: require_trailing_commas
        SearchProfileLoaded(
          moreProfiles: searchedProfiles,
          searchedProfiles: searchedProfiles,
        ),
      );
      page++;
    } catch (e) {
      searchedProfiles = [];
      emit(
        SearchProfileFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchMoreEvent(
    SearchProfileFetchMoreEvent event,
    Emitter<SearchProfileState> emit,
  ) async {
    if (page <= _repository.totalPageOfSearch) {
      try {
        final loadedMoreProfiles =
            await _repository.publicProfiles(page: page, forSearch: true);
        if (state.props.last != loadedMoreProfiles) {
          searchedProfiles += loadedMoreProfiles;
        }
        emit(
          SearchProfileLoaded(
            searchedProfiles: searchedProfiles,
            moreProfiles: loadedMoreProfiles,
          ),
        );
        page++;
      } catch (e) {
        emit(
          SearchProfileLoaded(
            searchedProfiles: searchedProfiles,
            moreProfiles: const [],
          ),
        );
      }
    }
  }
}
