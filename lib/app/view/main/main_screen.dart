import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/add_notif/add_notif_screen.dart';
import 'package:asman_work/app/view/home/home.dart';
import 'package:asman_work/app/view/main/bottom_navbar.dart';
import 'package:asman_work/app/view/profile/profile_screen.dart';
import 'package:asman_work/app/view/search/search_screen.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<Widget> bodies = const [
    Home(),
    SearchScreen(),
    AddNotifScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomData =
        BlocProvider.of<BottomNavigationProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 390.w,
        height: 844.h,
        child: bodies[getBodyIndex(bottomData.state)],
      ),
      bottomNavigationBar: const CustomBottomBar(),
      floatingActionButton: customFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container customFloatingActionButton() {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kcPrimaryColor,
          elevation: 8,
          child: const Icon(
            Icons.rectangle,
            color: kcSecondaryColor,
          ),
        ),
      ),
    );
  }
}
