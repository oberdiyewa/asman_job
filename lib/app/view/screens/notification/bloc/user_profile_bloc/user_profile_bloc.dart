import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(this.repository) : super(UserProfileInitial()) {
    on<UserProfileFetchEvent>(_onFetchEvent);
    on<UserProfileAddEvent>(_onAddEvent);
    on<UserProfileUpdateEvent>(_onUpdateEvent);
    on<UserProfileDeleteEvent>(_onDeleteEvent);
  }
  final UserProfileRepository repository;

  Future<void> _onFetchEvent(
    UserProfileFetchEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileLoading());
    try {
      final profiles = await repository.userProfileList();
      emit(
        UserProfileLoaded(
          profiles: profiles,
        ),
      );
    } catch (e) {
      emit(
        UserProfileFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onAddEvent(
    UserProfileAddEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      emit(UserProfileLoading());
      await repository.userProfileAdd(event.data);
      emit(UserProfileAddSuccess());
      add(UserProfileFetchEvent());
    } catch (e) {
      emit(
        UserProfileFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onUpdateEvent(
    UserProfileUpdateEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    // final profiles = (state as UserProfileLoaded).profiles;
    try {
      emit(UserProfileLoading());
      await repository.userProfileUpdate(event.data, event.id);
      emit(UserProfileAddSuccess());
      add(UserProfileFetchEvent());
    } catch (e) {
      emit(
        UserProfileFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteEvent(
    UserProfileDeleteEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    final profiles = (state as UserProfileLoaded).profiles;
    try {
      emit(UserProfileLoading());
      final response = await repository.userProfileDelete(event.id);
      if (response) {
        final updatedProfileList =
            profiles.where((e) => e.id != event.id).toList();

        print('Profiller $profiles');
        emit(UserProfileLoaded(profiles: updatedProfileList));
      } else {
        emit(UserProfileLoaded(profiles: profiles));
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
