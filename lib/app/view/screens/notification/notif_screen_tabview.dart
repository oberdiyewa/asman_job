import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:asman_work/app/view/screens/notification/add_profile/add_profile_screen.dart';
import 'package:asman_work/app/view/screens/notification/add_vacancy/add_vacancy_screen.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/notification/notif_widgets.dart';
import 'package:asman_work/components/ui/refresh_button.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifScreenTabView extends StatelessWidget {
  const NotifScreenTabView({
    required this.tabIndex,
    super.key,
  });
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return tabIndex == 0
        ? BlocConsumer<UserProfileBloc, UserProfileState>(
            listener: (ctx, state) {
              if (state is UserProfileFailure) {
                showErrorDialog(ctx, state.errorMessage);
              }
            },
            builder: (context, state) {
              // If Failed
              if (state is UserProfileFailure) {
                return JobRefreshButton(
                  onTap: () {
                    context.read<UserProfileBloc>().add(
                          UserProfileFetchEvent(),
                        );
                  },
                );
                // If Loaded successfully
              } else if (state is UserProfileLoaded) {
                final profileList = state.profiles;
                if (state.profiles.isEmpty) {
                  return const NotificationEmptyScreen(
                    widget: AddProfileScreen(),
                  );
                } else {
                  return UserAdvertisementsList(
                    isVacancy: false,
                    items: profileList,
                    fetchMore: () {
                      context.read<UserProfileBloc>().add(
                            UserProfileFetchMoreEvent(),
                          );
                    },
                  );
                }
                // If Loading
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        : BlocConsumer<UserVacancyBloc, UserVacancyState>(
            listener: (context, state) {},
            builder: (context, state) {
              // If Failed
              if (state is UserVacancyFailure) {
                return JobRefreshButton(
                  onTap: () {
                    context.read<UserVacancyBloc>().add(
                          UserVacancyFetchEvent(),
                        );
                  },
                );
                // If Loaded successfully
              } else if (state is UserVacancyLoaded) {
                final vacancyList = state.moreVacancies;
                if (state.vacancies.isEmpty) {
                  return const NotificationEmptyScreen(
                    widget: AddVacancyScreen(),
                  );
                } else {
                  return UserAdvertisementsList(
                    isVacancy: true,
                    items: vacancyList,
                    fetchMore: () {
                      context.read<UserVacancyBloc>().add(
                            UserVacancyFetchMoreEvent(),
                          );
                    },
                  );
                }
                // If Loading
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }

  Future<dynamic> showErrorDialog(BuildContext context, String errorMessage) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class UserAdvertisementsList extends StatefulWidget {
  const UserAdvertisementsList({
    required this.fetchMore,
    required this.items,
    required this.isVacancy,
    super.key,
  });

  final VoidCallback fetchMore;
  final List<dynamic> items;
  final bool isVacancy;

  @override
  State<UserAdvertisementsList> createState() => _UserAdvertisementsListState();
}

class _UserAdvertisementsListState extends State<UserAdvertisementsList> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController()..addListener(_scrollListener);

    super.initState();
  }

  bool isLoading = false;
  User? user;

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !isLoading) {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserFetchedSuccess) {
          user = state.user;
        }
        return CustomScrollView(
          clipBehavior: Clip.antiAlias,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: scrollController,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.zero,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final currentItem = widget.items[index];
                    return ListTile(
                      title: Text((currentItem.title) as String),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (context) => AddProfileScreen(
                                    profile: currentItem as Profile,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog<dynamic>(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: const Text('Uns berin!'),
                                    content: const Text(
                                      'Hakykatdan hem su bildirisi pozmak isleyarsinizmi?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: const Text('Yok'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                          context.read<UserProfileBloc>().add(
                                                UserProfileDeleteEvent(
                                                  currentItem.id as int,
                                                ),
                                              );
                                        },
                                        child: const Text('Hawa'),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: widget.items.length,
                ),
              ),
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
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: BoxButton.large(
                  title: 'Bildiriş ber',
                  onTap: () {
                    debugPrint('bildirish ber');
                    // if (user != null) {
                    // if (user!.email == null) {
                    //   showDialog<dynamic>(
                    //     context: context,
                    //     builder: (ctx) {
                    //       return AlertDialog(
                    //         content: const Text(
                    //           'Ilki bilen profilinize degisli kabir maglumatlary doldurmagynyzy hayys edyaris.',
                    //         ),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(ctx);
                    //               context
                    //                   .read<BottomNavigationProvider>()
                    //                   .changeScreen(EnumScreenName.profile);
                    //             },
                    //             child: const Text('Ok'),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                    // } else {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => !widget.isVacancy
                            ? const AddProfileScreen()
                            : const AddVacancyScreen(),
                      ),
                    );
                    // }
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
