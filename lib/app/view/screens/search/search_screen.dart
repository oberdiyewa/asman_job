// ignore: eol_at_end_of_file
import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/screens/home/components/draggable_scrollable_sheet/public_entity_list_item.dart';
import 'package:asman_work/app/view/screens/home/components/filter_screen.dart';
import 'package:asman_work/app/view/screens/search/bloc/bloc.dart';
import 'package:asman_work/components/ui/refresh_button.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: BlocBuilder<TabControllerCubit, TabControllerState>(
        builder: (context, state) {
          final tabState = state as TabControllerSelected;
          var isVacancy = true;
          if (tabState.draggableSheetState ==
              EnumDraggableSheetState.lookingWorker) {
            isVacancy = false;
          }
          final tabIndex = isVacancy ? 0 : 1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBarWidget(
                initailIndex: tabIndex,
              ),
              SearchScreenBody(
                isVacancy: isVacancy,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({
    required this.isVacancy,
    super.key,
  });
  final bool isVacancy;

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  late final TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SearchField(
            textEditingController: textController,
            isVacancy: widget.isVacancy,
          ),
          const SizedBox(
            height: 10,
          ),
          SearchItemList(
            isVacancy: widget.isVacancy,
            fetchMore: widget.isVacancy
                ? () {
                    context.read<SearchVacancyBloc>().add(
                          SearchVacancyFetchMoreEvent(
                            title: textController.text,
                          ),
                        );
                  }
                : () {
                    context.read<SearchProfileBloc>().add(
                          SearchProfileFetchMoreEvent(
                            title: textController.text,
                          ),
                        );
                  },
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    required this.textEditingController,
    required this.isVacancy,
    super.key,
  });

  final TextEditingController textEditingController;
  final bool isVacancy;

  @override
  Widget build(BuildContext context) {
    final throttleOnClick = throttle(2000, () {
      if (isVacancy) {
        context
            .read<SearchVacancyBloc>()
            .add(SearchVacancyFetchEvent(title: textEditingController.text));
      } else {
        context
            .read<SearchProfileBloc>()
            .add(SearchProfileFetchEvent(title: textEditingController.text));
      }
    });
    return Padding(
      padding: REdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 50.h,
        width: 370.w,
        child: BlocBuilder<TabControllerCubit, TabControllerState>(
          builder: (context, tabState) {
            return TextField(
              autofocus: kReleaseMode,
              controller: textEditingController,
              onChanged: (value) {
                if (textEditingController.text.length >= 3) {
                  throttleOnClick();
                }
              },
              decoration: InputDecoration(
                prefixIcon: Container(
                  width: 15.w,
                  height: 15.h,
                  margin: EdgeInsets.only(
                    right: 14.w,
                    left: 12.w,
                  ),
                  child: SvgPicture.asset(
                    Assets.searchNormalIcon,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).w,
                ),
                hintText:
                    isVacancy ? 'Iň ýakyn işi tap' : 'Iň amatly işgari tap',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).w,
                  borderSide: const BorderSide(
                    color: kcPrimaryColor,
                  ),
                ),
                hintStyle: TextStyle(
                  color: const Color.fromRGBO(149, 149, 149, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const FilterScreen(),
                      ),
                    );
                  },
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(Assets.filter),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SearchItemList extends StatefulWidget {
  const SearchItemList({
    required this.fetchMore,
    required this.isVacancy,
    super.key,
  });

  final VoidCallback fetchMore;
  final bool isVacancy;

  @override
  State<SearchItemList> createState() => _SearchItemList();
}

class _SearchItemList extends State<SearchItemList> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  int page = 1;
  bool isLoading = false;

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !isLoading) {
      int totalPage;
      if (widget.isVacancy) {
        totalPage = PublicVacancyRepository().totalPage;
      } else {
        totalPage = PublicProfileRepository().totalPage;
      }
      if (page < totalPage) {
        page++;
        setState(() {
          isLoading = true;
        });
        Future<dynamic>.delayed(
          const Duration(seconds: 1),
        ).then((dynamic value) {
          widget.fetchMore();
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TabControllerCubit, TabControllerState>(
        builder: (context, state) {
          final tabState = state as TabControllerSelected;
          return CustomScrollView(
            key: widget.key,
            clipBehavior: Clip.antiAlias,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            slivers: <Widget>[
              if (tabState.draggableSheetState ==
                  EnumDraggableSheetState.lookingWorker)
                const SearchedProfileList()
              else
                const SearchedVacancyList(),
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
              if (!isLoading)
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 100),
                ),
            ],
          );
        },
      ),
    );
  }
}

void Function() throttle(int timeInMillis, void Function() function) {
  final throttler = PublishSubject<void Function()>();

  throttler
      .throttleTime(
    Duration(milliseconds: timeInMillis),
    trailing: true,
    leading: false,
  )
      .forEach((element) {
    element();
  });

  return () {
    throttler.add(function);
  };
}

class SearchedVacancyList extends StatelessWidget {
  const SearchedVacancyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchVacancyBloc, SearchVacancyState>(
      listener: (context, state) {
        if (state is SearchVacancyFailure) {
          showDialog<dynamic>(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text(state.errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('OK'),
                )
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SearchVacancyLoaded) {
          final vacancyList = state.searchedVacancies;
          return SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final currentVacancy = vacancyList[index];
                  return PublicEntityListItem(
                    publicEntity: currentVacancy,
                    isVacancy: true,
                  );
                },
                childCount: vacancyList.length,
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
                  child: (state is SearchVacancyLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : JobRefreshButton(
                          onTap: () {
                            context
                                .read<SearchVacancyBloc>()
                                .add(const SearchVacancyFetchEvent());
                          },
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

class SearchedProfileList extends StatelessWidget {
  const SearchedProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchProfileBloc, SearchProfileState>(
      listener: (context, state) {
        if (state is SearchProfileFailure) {
          showDialog<dynamic>(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text(state.errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('OK'),
                )
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SearchProfileLoaded) {
          final profileList = state.searchedProfiles;
          return SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final currentProfile = profileList[index];
                  return PublicEntityListItem(
                    publicEntity: currentProfile,
                    isVacancy: false,
                  );
                },
                childCount: profileList.length,
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
                  child: (state is SearchProfileLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : JobRefreshButton(
                          onTap: () {
                            context
                                .read<SearchProfileBloc>()
                                .add(const SearchProfileFetchEvent());
                          },
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

class SearchSuggestionsWidget extends StatelessWidget {
  const SearchSuggestionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.centerLeft,
      width: screenWidth(context),
      height: 55.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: kcLightGreyColor),
              borderRadius: BorderRadius.circular(20).w,
            ),
            padding: REdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
            margin: const EdgeInsets.only(left: 5, top: 17, bottom: 3).w,
            child: Center(
              child: Text(
                'Programmist $index',
                style: TextStyle(
                  color: kcHardGreyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
