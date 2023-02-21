import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'public_profile_event.dart';
part 'public_profile_state.dart';

class PublicProfileBloc extends Bloc<PublicProfileEvent, PublicProfileState> {
  PublicProfileBloc(this._repository) : super(PublicProfileInitial()) {
    on<PublicProfileFetchEvent>(_onFetchEvent);
    on<PublicProfileFetchMoreEvent>(_onFetchMoreEvent);
  }

  final PublicProfileRepository _repository;

  late List<PublicEntity> profiles;
  int page = 1;

  Future<void> _onFetchEvent(
    PublicProfileFetchEvent event,
    Emitter<PublicProfileState> emit,
  ) async {
    if (page <= _repository.totalPage) {}
    emit(PublicProfileLoading());
    try {
      profiles = await _repository.publicProfiles(page: page);
      emit(
        PublicProfileLoaded(
          profiles: profiles,
          moreProfiles: profiles,
        ),
      );
      page++;
    } catch (e) {
      profiles = [];
      emit(
        PublicProfileFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchMoreEvent(
    PublicProfileFetchMoreEvent event,
    Emitter<PublicProfileState> emit,
  ) async {
    if (page <= _repository.totalPage) {
      try {
        final loadedMoreprofiles =
            await _repository.publicProfiles(page: page);
        if (state.props.last != loadedMoreprofiles) {
          profiles += loadedMoreprofiles;
        }
        emit(
          PublicProfileLoaded(
            profiles: profiles,
            moreProfiles: loadedMoreprofiles,
          ),
        );
        page++;
      } catch (e) {
        emit(
          PublicProfileLoaded(
            profiles: profiles,
            moreProfiles: const [],
          ),
        );
      }
    }
  }
}
