// ignore: eol_at_end_of_file
import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/notification/notif_screen_tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    final catalogueBlocState = context.read<UserCatalogueBloc>().state;
    if (catalogueBlocState is! UserCatalogueLoaded) {
      context.read<UserCatalogueBloc>().add(UserCatalogueFetchEvent());
    }
    context.read<UserVacancyBloc>().add(UserVacancyFetchEvent());
    context.read<UserProfileBloc>().add(UserProfileFetchEvent());
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth(context),
            height: 50.h,
            color: const Color.fromRGBO(51, 67, 152, 1),
            child: Center(
              child: BoxText.headline(
                'Bildiriş',
                color: kcSecondaryTextColor,
              ),
            ),
          ),
          notifScreenTabBar(),
          Expanded(
            child: SizedBox(
              height: screenHeight(context),
              child: TabBarView(
                controller: tabController,
                children: const [
                  NotifScreenTabView(tabIndex: 0), // User Profile list
                  NotifScreenTabView(tabIndex: 1), // User Vacancy list
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Material notifScreenTabBar() {
    return Material(
      child: Container(
        width: 390.w,
        height: 50.h,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: kcPrimaryColor,
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: kcSecondaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: BoxText.headline(
                'Iş gözleýän',
                color: kcSecondaryTextColor,
              ),
            ),
            Tab(
              child: BoxText.headline(
                'Işgär gözleýän',
                color: kcSecondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
