import 'package:asman_work/data/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vacancy_detail_event.dart';
part 'vacancy_detail_state.dart';

class VacancyDetailBloc extends Bloc<VacancyDetailEvent, VacancyDetailState> {
  VacancyDetailBloc() : super(VacancyDetailInitial()) {
    on<VacancyDetailFetchEvent>(_onVacancyDetailFetch);
  }

  Future<void> _onVacancyDetailFetch(
    VacancyDetailFetchEvent event,
    Emitter<VacancyDetailState> emit,
  ) async {
    
  }
}
