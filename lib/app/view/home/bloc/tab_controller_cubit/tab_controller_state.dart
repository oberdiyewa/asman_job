part of 'tab_controller_cubit.dart';

abstract class TabControllerState extends Equatable {
  const TabControllerState();

  @override
  List<Object> get props => [];
}

class TabControllerInitial extends TabControllerState {}

class TabControllerSelected extends TabControllerState {
  const TabControllerSelected(this.draggableSheetState,
      {this.id, this.isVacancy,});

  final EnumDraggableSheetState draggableSheetState;
  final int? id;
  final bool? isVacancy;

  @override
  List<Object> get props => [draggableSheetState];
}
