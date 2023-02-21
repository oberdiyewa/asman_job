import 'package:asman_work/app/view/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapHeaderWidget extends StatelessWidget {
  const MapHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, TabControllerState>(
      builder: (context, state) {
        final tabState = state as TabControllerSelected;
        if (tabState.draggableSheetState != EnumDraggableSheetState.detail) {
          final isVacancy =
              tabState.draggableSheetState == EnumDraggableSheetState.none ||
                  tabState.draggableSheetState ==
                      EnumDraggableSheetState.lookingJob;
          final initialIndex = isVacancy ? 0 : 1;
          return TabBarWidget(initailIndex: initialIndex,);
        } else {
          final isVacancy = tabState.isVacancy!;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).iconTheme.color,
              shape: const CircleBorder(),
              child: IconButton(
                onPressed: () {
                  isVacancy
                      ? context.read<TabControllerCubit>().changeTab(
                            EnumDraggableSheetState.lookingJob,
                          )
                      : context.read<TabControllerCubit>().changeTab(
                            EnumDraggableSheetState.lookingWorker,
                          );
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
