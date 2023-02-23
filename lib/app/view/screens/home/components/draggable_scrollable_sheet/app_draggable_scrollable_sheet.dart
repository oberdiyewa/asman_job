import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/screens/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/screens/home/components/draggable_scrollable_sheet/draggbale_entity_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDraggableScrollableSheet extends StatefulWidget {
  const AppDraggableScrollableSheet({super.key});

  @override
  State<AppDraggableScrollableSheet> createState() =>
      _AppDraggableScrollableSheetState();
}

class _AppDraggableScrollableSheetState
    extends State<AppDraggableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TabControllerCubit, TabControllerState>(
      builder: (context, tabState) {
        final currentState = tabState as TabControllerSelected;
        if (currentState.draggableSheetState ==
                EnumDraggableSheetState.lookingJob ||
            currentState.draggableSheetState == EnumDraggableSheetState.none) {
          return DraggableEntityList(
            key: const Key('Public Vacancy list'),
            tabState: currentState.draggableSheetState,
            screenHeight: screenHeight,
          );
        } else {
          return DraggableEntityList(
            key: const Key('Public Profile list'),
            tabState: currentState.draggableSheetState,
            screenHeight: screenHeight,
          );
        }
      },
    );
  }
}
