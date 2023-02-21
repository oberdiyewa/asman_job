import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(this.repository) : super(UserProfileInitial()) {
    on<UserProfileFetchEvent>(_onFetchEvent);
    on<UserProfileFetchMoreEvent>(_onFetchMoreEvent);
    on<UserProfileDeleteEvent>(_onDeleteEvent);
  }
  final UserProfileRepository repository;

  late List<PublicProfileDetail> profiles;
  int page = 1;

  Future<void> _onFetchEvent(
    UserProfileFetchEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    if (page <= repository.userProfileTotalPage) {}
    emit(UserProfileLoading());
    try {
      profiles = await repository.userProfileList(page: page);
      emit(
        UserProfileLoaded(
          profiles: profiles,
          moreProfiles: profiles,
        ),
      );
      page++;
    } catch (e) {
      profiles = [];
      emit(
        UserProfileFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchMoreEvent(
    UserProfileFetchMoreEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    if (page <= repository.userProfileTotalPage) {
      try {
        final loadedMoreProfiles = await repository.userProfileList(page: page);
        if (state.props.last != loadedMoreProfiles) {
          profiles += loadedMoreProfiles;
        }
        emit(
          UserProfileLoaded(
            profiles: profiles,
            moreProfiles: loadedMoreProfiles,
          ),
        );
        page++;
      } catch (e) {
        emit(
          UserProfileLoaded(
            profiles: profiles,
            moreProfiles: const [],
          ),
        );
      }
    }
  }

  Future<void> _onDeleteEvent(
    UserProfileDeleteEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      final response = await repository.userProfileDelete(event.id);
      if (response) {
        emit(UserProfileLoading());
        final updatedProfileList =
            profiles.where((e) => e.id != event.id).toList();
        profiles = updatedProfileList;
        print('Profiller $profiles');
        emit(UserProfileLoaded(profiles: profiles, moreProfiles: const []));
      } else {
        emit(UserProfileLoaded(profiles: profiles, moreProfiles: const []));
      }
    } catch (e) {
      emit(
        UserProfileFailure(
          e.toString(),
        ),
      );
    }
  }
}
