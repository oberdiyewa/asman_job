import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_controller_state.dart';

class TabControllerCubit extends Cubit<TabControllerState> {
  TabControllerCubit() : super(TabControllerInitial());

  void changeTab(
    EnumDraggableSheetState state, {
    int? id,
    bool? isVacancy,
  }) {
    emit(TabControllerSelected(state, id: id, isVacancy: isVacancy));
  }
}

enum EnumDraggableSheetState { none, lookingJob, lookingWorker, detail }
