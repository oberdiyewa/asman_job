import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/home/home.dart';
import 'package:asman_work/app/view/main/bottom_navbar.dart';
import 'package:asman_work/app/view/notification_screen/notif_screen.dart';
import 'package:asman_work/app/view/profile/profile_screen.dart';
import 'package:asman_work/app/view/search/search_screen.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int getBodyIndex(EnumScreenName name) {
    switch (name) {
      case EnumScreenName.home:
        return 0;
      case EnumScreenName.search:
        return 1;
      case EnumScreenName.notifs:
        return 2;
      case EnumScreenName.profile:
        return 3;
    }
  }

  List<NavBarItem> items = [
    NavBarItem(Assets.homeSelected, Assets.homeUnselected, Home(),
        label: EnumScreenName.home),
    NavBarItem(Assets.searchSelected, Assets.searchUnselected, SearchScreen(),
        label: EnumScreenName.search),
    NavBarItem(
      Assets.notifSelected,
      Assets.notifUnselected,
      NotificationScreen(),
      label: EnumScreenName.notifs,
    ),
    NavBarItem(
      Assets.profileSelected,
      Assets.profileUnselected,
      ProfileScreen(),
      label: EnumScreenName.profile,
    ),
  ];

  // List<Widget> bodies = const [
  //   Home(),
  //   SearchScreen(),
  //   AddNotifScreen(),
  //   ProfileScreen()
  // ];

  @override
  Widget build(BuildContext context) {
    final bottomData =
        BlocProvider.of<BottomNavigationProvider>(context, listen: true);

    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final keyboardIsOpened = bottomPadding != 0.0;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: 390.w,
        height: 844.h,
        child: items[getBodyIndex(bottomData.state)].view,
      ),
      bottomNavigationBar:
          BlocBuilder<TabControllerCubit, EnumDraggableSheetState>(
        builder: (context, state) {
          if (state == EnumDraggableSheetState.detail) {
            return const SizedBox.shrink();
          } else {
            return CustomBottomBar(
              items: items,
            );
          }
        },
      ),
      floatingActionButton:
          BlocBuilder<TabControllerCubit, EnumDraggableSheetState>(
        builder: (context, state) {
          if (state == EnumDraggableSheetState.detail || keyboardIsOpened) {
            return const SizedBox.shrink();
          } else {
            return customFloatingActionButton();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container customFloatingActionButton() {
    return Container(
      width: 80.w,
      height: 80.h,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(Assets.menuIcon)),
      ),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SvgPicture.asset(Assets.menuIcon),
        ),
      ),
    );
  }
}
