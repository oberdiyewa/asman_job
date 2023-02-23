import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    required this.initailIndex,
    super.key,
  });

  final int initailIndex;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: widget.initailIndex,
      length: 2,
      vsync: this,
    );
  }

  void _changeTab(int? value) {
    if (value == 0) {
      context
          .read<TabControllerCubit>()
          .changeTab(EnumDraggableSheetState.lookingJob);
    } else {
      context
          .read<TabControllerCubit>()
          .changeTab(EnumDraggableSheetState.lookingWorker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.h,
        padding: const EdgeInsets.all(4).w,
        margin: const EdgeInsets.only(top: 10).w,
        decoration: BoxDecoration(
          color: kcSecondaryTextColor,
          borderRadius: BorderRadius.circular(20).w,
        ),
        child: TabBar(
          onTap: _changeTab,
          labelColor: kcSecondaryColor,
          unselectedLabelColor: kcHardGreyColor,
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).w,
            ),
            color: kcPrimaryColor,
          ),
          controller: tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.searchWorkIcon,
                    colorFilter: ColorFilter.mode(
                      tabController!.index == 0
                          ? kcSecondaryColor
                          : kcHardGreyColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  horizontalSpaceRegular,
                  BoxText.headline('Iş gözleýän')
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 20,
                  ),
                  horizontalSpaceRegular,
                  BoxText.headline('Işgär gözleýän'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
