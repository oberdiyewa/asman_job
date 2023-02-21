import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/home/components/draggable_scrollable_sheet/draggable_entity_detail.dart';
import 'package:asman_work/app/view/home/components/draggable_scrollable_sheet/draggbale_entity_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDraggableScrollableSheet extends StatelessWidget {
  const AppDraggableScrollableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TabControllerCubit, TabControllerState>(
      builder: (context, tabState) {
        final currentState = tabState as TabControllerSelected;
        if (currentState.draggableSheetState ==
            EnumDraggableSheetState.detail) {
          return DraggableEntityDetail(
            id: currentState.id!,
            isVacancy: currentState.isVacancy!,
          );
        } else {
          return DraggableEntityList(
            tabState: tabState.draggableSheetState,
            screenHeight: screenHeight,
          );
        }
      },
    );
  }
}

class VacancyDetailInfo extends StatelessWidget {
  const VacancyDetailInfo(
    this.text, {
    required this.value,
    super.key,
  });
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: kcPrimaryTextColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: kcHardGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
