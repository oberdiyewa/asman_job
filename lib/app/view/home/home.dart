import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/home/components/app_draggable_scrollable_sheet.dart.dart';
import 'package:asman_work/app/view/home/components/map_header_widget.dart';
import 'package:asman_work/app/view/home/components/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      setState(() {
        if (tabController!.index == 0) {
          context
              .read<TabControllerCubit>()
              .changeTab(EnumDraggableSheetState.lookingJob);
        } else {
          context
              .read<TabControllerCubit>()
              .changeTab(EnumDraggableSheetState.lookingWorker);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Stack(
        children: [
          const MapWidget(),
          MapHeaderWidget(tabController: tabController),
          const Positioned.fill(
            child: AppDraggableScrollableSheet(),
          )
        ],
      ),
    );
  }
}




//38.1234, 58.0823
