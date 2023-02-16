import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/home/bloc/public_vacancy_bloc/public_vacancy_bloc.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/home/components/app_draggable_scrollable_sheet.dart.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/home/components/sliding_panel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraggableVacancyList extends StatefulWidget {
  const DraggableVacancyList({
    super.key,
    required this.tabState,
    required this.screenHeight,
  });
  final EnumDraggableSheetState tabState;
  final double screenHeight;

  @override
  State<DraggableVacancyList> createState() => _DraggableVacancyListState();
}

class _DraggableVacancyListState extends State<DraggableVacancyList> {
  final panelHeightOpen = 0.932;
  final panelHeightClosed = 0.5;
  double notificationExtent = 0.5;
  late double fabHeight;
  int page = 1;

  @override
  void initState() {
    fabHeight = widget.screenHeight * panelHeightClosed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            setState(() {
              fabHeight = screenHeight * notification.extent;
              notificationExtent = notification.extent;
            });
            return true;
          },
          child: DraggableScrollableSheet(
            key: const Key('Vacancy list'),
            minChildSize: panelHeightClosed,
            maxChildSize: panelHeightOpen,
            // snap: true,
            builder: (context, scrollController) {
              return AppCustomScrollView(
                controller: scrollController,
                tabState: widget.tabState,
              );
            },
          ),
        ),
        Positioned(
          left: 20,
          bottom: fabHeight,
          child: buildFABandUSERNAME(const CustomButton()),
        ),
        Positioned(
          right: 20,
          bottom: fabHeight,
          child: buildFABandUSERNAME(const FindMyLocationWidget()),
        ),
      ],
    );
  }

  Widget buildFABandUSERNAME(Widget child) {
    return AnimatedOpacity(
      opacity: (0.932 - notificationExtent) * 2.3,
      duration: const Duration(milliseconds: 200),
      child: notificationExtent < 0.85 ? child : null,
    );
  }
}

class AppCustomScrollView extends StatefulWidget {
  const AppCustomScrollView({
    super.key,
    required this.controller,
    required this.tabState,
  });

  final ScrollController controller;
  final EnumDraggableSheetState tabState;

  @override
  State<AppCustomScrollView> createState() => _AppCustomScrollViewState();
}

class _AppCustomScrollViewState extends State<AppCustomScrollView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.antiAlias,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      controller: widget.controller
        ..addListener(() {
          if (widget.controller.offset >=
                  widget.controller.position.maxScrollExtent &&
              !isLoading) {
            setState(() {
              isLoading = true;
            });
            Future<dynamic>.delayed(
              const Duration(seconds: 1),
            ).then((dynamic value) {
              context
                  .read<PublicVacancyBloc>()
                  .add(const PublicVacancyFetchMoreEvent());
              isLoading = false;
            });
          }
        }),
      slivers: <Widget>[
        const SliverAppBar(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          pinned: true,
          flexibleSpace: SlidingPanelAppBar(),
        ),
        if (widget.tabState == EnumDraggableSheetState.lookingJob)
          PublicVancancyList(isLoading: isLoading),
        if (widget.tabState == EnumDraggableSheetState.lookingWorker)
          const PublicWorkerList(),
        if (isLoading)
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Expanded(
                    child: Center(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        if (widget.tabState == EnumDraggableSheetState.lookingWorker)
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
                    title: const Text('Hello'),
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        if (widget.tabState == EnumDraggableSheetState.detail)
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
      ],
    );
  }
}

class VacancyDetailWidget extends StatelessWidget {
  const VacancyDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
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
    );
  }
}

class PublicWorkerList extends StatelessWidget {
  const PublicWorkerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 100.h,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Material(
            color: Colors.white,
            child: ListTile(
              onTap: () => context
                  .read<TabControllerCubit>()
                  .changeTab(EnumDraggableSheetState.detail),
              title: const Text('Hello'),
            ),
          );
        },
        childCount: 3,
      ),
    );
  }
}

class PublicVancancyList extends StatelessWidget {
  const PublicVancancyList({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
      builder: (context, state) {
        if (state is! PublicVacancyLoaded) {
          // Loading widget
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
          final _vacancies = state.vacancies;
          print(
            'length-${_vacancies.length}, page-${context.read<PublicVacancyBloc>().page}',
          );
          return SliverFixedExtentList(
            itemExtent: 130.h,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final currVacancy = _vacancies[index];
                return VacancyListItem(
                  vacancy: currVacancy,
                );
              },
              childCount: _vacancies.length,
            ),
          );
        }
      },
    );
  }
}
