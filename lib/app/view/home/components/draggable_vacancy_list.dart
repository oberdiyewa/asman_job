import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/public_vacancy_bloc/public_vacancy_bloc.dart';
import '../bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'app_draggable_scrollable_sheet.dart.dart';

class DraggableVacancyList extends StatelessWidget {
  const DraggableVacancyList({Key? key, required this.tabState})
      : super(key: key);
  final EnumDraggableSheetState tabState;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: const Key('Vacancy list'),
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.932,
      // snap: true,
      builder: (context, scrollController) {
        List<Widget> _sliverList() {
          final widgetList = <Widget>[
            SliverAppBar(
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              flexibleSpace: slidingPanelAppBar(context),
            ),
            if (tabState == EnumDraggableSheetState.lookingJob)
              BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
                builder: (context, state) {
                  if (state is! PublicVacancyLoaded) {
                    return SliverFixedExtentList(
                      itemExtent: 200,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return const Material(
                            color: Colors.white,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    );
                  } else {
                    final vacancyList = state.vacancies;
                    return SliverFixedExtentList(
                      itemExtent: 100.h,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final currVacancy = vacancyList[index];
                          return itemWidget(
                            context,
                            currVacancy,
                          );
                        },
                        childCount: vacancyList.length,
                      ),
                    );
                  }
                },
              ),
            if (tabState == EnumDraggableSheetState.lookingWorker)
              SliverFixedExtentList(
                itemExtent: 100.h,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Material(
                      color: Colors.white,
                      child: ListTile(
                          onTap: () => context
                              .read<TabControllerCubit>()
                              .changeTab(EnumDraggableSheetState.detail),
                          title: const Text('Hello')),
                    );
                  },
                  childCount: 3,
                ),
              ),
            if (tabState == EnumDraggableSheetState.detail)
              SliverFixedExtentList(
                itemExtent: screenWidth(context),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const Material(
                      color: Colors.white,
                      child: ListTile(title: Text('Detail')),
                    );
                  },
                  childCount: 1,
                ),
              ),
          ];

          return widgetList;
        }

        return CustomScrollView(
          clipBehavior: Clip.antiAlias,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: scrollController,
          slivers: _sliverList(),
        );
      },
    );
  }
}
