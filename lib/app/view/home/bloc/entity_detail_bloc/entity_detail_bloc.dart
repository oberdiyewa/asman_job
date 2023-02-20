import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/repository/vacancy_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'entity_detail_event.dart';
part 'entity_detail_state.dart';

class EntityDetailBloc extends Bloc<EntityDetailEvent, EntityDetailState> {
  EntityDetailBloc(this.repository) : super(EntityDetailInitial()) {
    on<EntityDetailFetchEvent>(_onEntityDetailFetch);
  }
  final VacancyRepository repository;

  VacancyDetail? _detail;

  Future<void> _onEntityDetailFetch(
    EntityDetailFetchEvent event,
    Emitter<EntityDetailState> emit,
  ) async {
    emit(EntityDetailLoading());
    try {
      if (_detail != null && _detail!.id == event.id) {
        emit(
          EntityDetailLoaded(_detail!),
        );
      } else {
        final vDetail = await repository.vacancyDetail(event.id);
        _detail = vDetail;
        emit(EntityDetailLoaded(_detail!));
      }
    } on DioError catch (e) {
      emit(
        EntityDetailFailure(e.toString()),
      );
    } catch (e) {
      emit(
        EntityDetailFailure(e.toString()),
      );
    }
  }
}
