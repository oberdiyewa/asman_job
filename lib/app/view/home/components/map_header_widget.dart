import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapHeaderWidget extends StatelessWidget {
  const MapHeaderWidget({
    super.key,
    required this.tabController,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TabControllerCubit, EnumDraggableSheetState>(
          builder: (context, state) {
            if (state != EnumDraggableSheetState.detail) {
              return TabBarWidget(
                tabController: tabController,
              );
            } else {
              return Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    color: Theme.of(context).iconTheme.color,
                    shape: const CircleBorder(),
                    child: IconButton(
                        onPressed: () =>
                            context.read<TabControllerCubit>().changeTab(
                                  EnumDraggableSheetState.lookingJob,
                                ),
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 32,
                        ),),
                  ),
                ),
              );
            }
          },
        ),
        Container(
          height: 50.h,
          margin: EdgeInsets.only(top: 10.h).r,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context),
                // color: Colors.red,
              ),
              SizedBox(
                width: screenWidth(context),
                height: 400.h,
                // color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
