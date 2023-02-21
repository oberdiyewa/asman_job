import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.repository) : super(UserInitial()) {
    on<UserFetchEvent>(_onUserFetchEvent);
  }
  final UserRepository repository;

  Future<void> _onUserFetchEvent(
    UserFetchEvent event,
    Emitter<UserState> emit,
  ) async {
    if (event.isUserRegistred) {
      emit(UserLoading());
      try {
        final user = await repository.remoteUser();
        
        emit(UserFetchedSuccess(user));
      } catch (e) {
        emit(
          UserFailure(
            e.toString(),
          ),
        );
      }
    } else {
      emit(UserInitial());
    }
  }
}
