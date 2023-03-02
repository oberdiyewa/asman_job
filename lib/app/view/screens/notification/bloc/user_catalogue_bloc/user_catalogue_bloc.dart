import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/model/user_catalogue/user_catalogue.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_catalogue_event.dart';
part 'user_catalogue_state.dart';

class UserCatalogueBloc extends Bloc<UserCatalogueEvent, UserCatalogueState> {
  UserCatalogueBloc(this.repository) : super(UserCatalogueInitial()) {
    on<UserCatalogueFetchEvent>(_onFetch);
  }

  final UserCatalogueRepository repository;

  Future<void> _onFetch(
    UserCatalogueFetchEvent event,
    Emitter<UserCatalogueState> emit,
  ) async {
    emit(UserCatalogueLoading());
    try {
      final userCatalogue = await repository.userCatalogue();
      emit(
        UserCatalogueLoaded(
          userCatalogue: userCatalogue,
          // educationTypes: userCatalogue.educationType ?? [],
          // employmentTypes: userCatalogue.employmentType ?? [],
          // languages: userCatalogue.language ?? [],
          // industries: userCatalogue.industry ?? [],
        ),
      );
    } catch (e) {
      emit(
        UserCatalogueFailure(
          e.toString(),
        ),
      );
    }
  }
}
