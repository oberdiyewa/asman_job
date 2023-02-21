import 'package:asman_work/app/view/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/home/components/draggable_scrollable_sheet/draggable_sheet_appbar.dart';
import 'package:asman_work/app/view/home/components/draggable_scrollable_sheet/draggable_sheet_list_item.dart';
import 'package:asman_work/app/view/home/components/user_name_and_location_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraggableEntityList extends StatefulWidget {
  const DraggableEntityList({
    required this.tabState,
    required this.screenHeight,
    super.key,
  });
  final EnumDraggableSheetState tabState;
  final double screenHeight;

  @override
  State<DraggableEntityList> createState() => _DraggableEntityListState();
}

class _DraggableEntityListState extends State<DraggableEntityList> {
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
          child: (widget.tabState == EnumDraggableSheetState.lookingJob ||
                  widget.tabState == EnumDraggableSheetState.none)
              ? DraggableScrollableSheet(
                  key: const Key('Public Vacancy list'),
                  minChildSize: panelHeightClosed,
                  maxChildSize: panelHeightOpen,
                  // snap: true,
                  builder: (context, scrollController) {
                    return HomeCustomScrollView(
                      controller: scrollController,
                      tabState: widget.tabState,
                      fetchEvent: () {
                        context
                            .read<PublicVacancyBloc>()
                            .add(const PublicVacancyFetchMoreEvent());
                      },
                    );
                  },
                )
              : DraggableScrollableSheet(
                  key: const Key('Public Profile list'),
                  minChildSize: panelHeightClosed,
                  maxChildSize: panelHeightOpen,
                  // snap: true,
                  builder: (context, scrollController) {
                    return HomeCustomScrollView(
                      controller: scrollController,
                      tabState: widget.tabState,
                      fetchEvent: () {
                        context
                            .read<PublicProfileBloc>()
                            .add(const PublicProfileFetchMoreEvent());
                      },
                    );
                  },
                ),
        ),
        Positioned(
          left: 20,
          bottom: fabHeight,
          child: buildLocationAndUserName(const UserNameWidget()),
        ),
        Positioned(
          right: 20,
          bottom: fabHeight,
          child: buildLocationAndUserName(const FindMyLocationWidget()),
        ),
      ],
    );
  }

  Widget buildLocationAndUserName(Widget child) {
    return AnimatedOpacity(
      opacity: (0.932 - notificationExtent) * 2.3,
      duration: const Duration(milliseconds: 200),
      child: notificationExtent < 0.85 ? child : null,
    );
  }
}

class HomeCustomScrollView extends StatefulWidget {
  const HomeCustomScrollView({
    required this.controller,
    required this.tabState,
    required this.fetchEvent,
    super.key,
  });

  final ScrollController controller;
  final EnumDraggableSheetState tabState;
  final VoidCallback fetchEvent;

  @override
  State<HomeCustomScrollView> createState() => _HomeCustomScrollViewState();
}

class _HomeCustomScrollViewState extends State<HomeCustomScrollView> {
  @override
  void initState() {
    widget.controller.addListener(_scrollListener);
    super.initState();
  }

  bool isLoading = false;

  void _scrollListener() {
    if (widget.controller.offset >=
            widget.controller.position.maxScrollExtent &&
        !isLoading) {
      setState(() {
        isLoading = true;
      });
      Future<dynamic>.delayed(
        const Duration(seconds: 1),
      ).then((dynamic value) {
        widget.fetchEvent();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: CustomScrollView(
        clipBehavior: Clip.antiAlias,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: widget.controller,
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
          if (widget.tabState == EnumDraggableSheetState.none ||
              widget.tabState == EnumDraggableSheetState.lookingJob)
            PublicVancancyList(
              isLoading: isLoading,
              fromSearch: false,
            ),
          if (widget.tabState == EnumDraggableSheetState.lookingWorker)
            PublicProfileList(
              isLoading: isLoading,
              fromSearch: false,
            ),
          if (isLoading)
            SliverToBoxAdapter(
              child: Container(
                height: 150,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topCenter,
                child: const CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

class PublicVancancyList extends StatelessWidget {
  const PublicVancancyList({
    required this.isLoading,
    required this.fromSearch,
    super.key,
  });

  final bool isLoading;
  final bool fromSearch;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicVacancyBloc, PublicVacancyState>(
      listener: (context, state) {
        if (state is PublicVacancyFailure) {
          showDialog<dynamic>(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PublicVacancyLoaded) {
          final vacancies = state.vacancies;
          print(
            'length-${vacancies.length}, page-${context.read<PublicVacancyBloc>().page}',
          );
          return SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final currVacancy = vacancies[index];
                  return PublicEntityListItem(
                    publicEntity: currVacancy,
                    fromSearch: fromSearch,
                    isVacancy: true,
                  );
                },
                childCount: vacancies.length,
              ),
            ),
          );
        } else {
          return SliverFixedExtentList(
            itemExtent: 200,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Material(
                  color: Colors.white,
                  child: Center(
                    child: state is PublicVacancyLoading
                        ? const CircularProgressIndicator()
                        : Material(
                            clipBehavior: Clip.antiAlias,
                            shape: const CircleBorder(),
                            elevation: 3,
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<PublicVacancyBloc>()
                                    .add(const PublicVacancyFetchEvent());
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ),
                  ),
                );
              },
              childCount: 1,
            ),
          );
        }
      },
    );
  }
}

class PublicProfileList extends StatelessWidget {
  const PublicProfileList({
    required this.isLoading,
    required this.fromSearch,
    super.key,
  });

  final bool isLoading;
  final bool fromSearch;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicProfileBloc, PublicProfileState>(
      listener: (context, state) {
        if (state is PublicProfileFailure) {
          showDialog<dynamic>(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PublicProfileLoaded) {
          final profiles = state.profiles;
          print(
            'length-${profiles.length}, page-${context.read<PublicProfileBloc>().page}',
          );
          return SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final currProfile = profiles[index];
                  return PublicEntityListItem(
                    publicEntity: currProfile,
                    fromSearch: fromSearch,
                    isVacancy: false,
                  );
                },
                childCount: profiles.length,
              ),
            ),
          );
        } else {
          return SliverFixedExtentList(
            itemExtent: 200,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Material(
                  color: Colors.white,
                  child: Center(
                    child: state is PublicVacancyLoading
                        ? const CircularProgressIndicator()
                        : Material(
                            clipBehavior: Clip.antiAlias,
                            shape: const CircleBorder(),
                            elevation: 3,
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<PublicVacancyBloc>()
                                    .add(const PublicVacancyFetchEvent());
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ),
                  ),
                );
              },
              childCount: 1,
            ),
          );
        }
      },
    );
  }
}
