import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'public_vacancy_detail_event.dart';
part 'public_vacancy_detail_state.dart';

class PublicVacancyDetailBloc
    extends Bloc<PublicVacancyDetailEvent, PublicVacancyDetailState> {
  PublicVacancyDetailBloc(this.repository)
      : super(PublicVacancyDetailInitial()) {
    on<PublicVacancyDetailFetchEvent>(_onEntityDetailFetch);
  }

  final PublicVacancyRepository repository;

  PublicVacancyDetail? _detail;

  Future<void> _onEntityDetailFetch(
    PublicVacancyDetailFetchEvent event,
    Emitter<PublicVacancyDetailState> emit, 
  ) async {
    emit(PublicVacancyDetailLoading());
    if (_detail != null && _detail!.id == event.id) {
      emit(
        PublicVacancyDetailLoaded(_detail!),
      );
    } else {
      try {
        final vDetail = await repository.vacancyDetail(event.id);
        _detail = vDetail;
        emit(PublicVacancyDetailLoaded(_detail!));
      } catch (e) {
        emit(
          PublicVacancyDetailFailure(e.toString()),
        );
      }
    }
  }
}
