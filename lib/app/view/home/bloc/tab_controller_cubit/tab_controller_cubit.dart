import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'tab_controller_state.dart';

class TabControllerCubit extends Cubit<EnumDraggableSheetState> {
  TabControllerCubit() : super(EnumDraggableSheetState.lookingJob);

  void changeTab(EnumDraggableSheetState state) {
    emit(state);
  }
}

enum EnumDraggableSheetState { lookingJob, lookingWorker, detail }
