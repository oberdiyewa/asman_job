import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bottom_navbar.dart';
import 'package:asman_work/app/view/main/main_widgets.dart/hexagon.dart';
import 'package:asman_work/app/view/screens/chat_screen/chat_screen.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/screens/home/home.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/notification/notif_screen.dart';
import 'package:asman_work/app/view/screens/profile/profile_screen.dart';
import 'package:asman_work/app/view/screens/search/search_screen.dart';

import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/data/repository/repository.dart';
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
      case EnumScreenName.chat:
        return 3;
      case EnumScreenName.profile:
        return 4;
    }
  }

  List<NavBarItem> items = [
    NavBarItem(
      Assets.homeSelected,
      Assets.homeUnselected,
      const Home(),
      label: EnumScreenName.home,
      title: 'Esasy',
    ),
    NavBarItem(
      Assets.searchSelected,
      Assets.searchUnselected,
      const SearchScreen(),
      label: EnumScreenName.search,
      title: 'Gozleg',
    ),
    NavBarItem(
      Assets.notifSelected,
      Assets.notifUnselected,
      MultiBlocProvider(
        providers: [
          BlocProvider<UserVacancyBloc>(
            create: (_) => UserVacancyBloc(UserVacancyRepository()),
          ),
          BlocProvider<UserProfileBloc>(
            create: (_) => UserProfileBloc(
              UserProfileRepository(),
            ),
          ),
        ],
        child: const NotificationScreen(),
      ),
      label: EnumScreenName.notifs,
      title: 'Bildiris ber',
    ),
    NavBarItem(
      Assets.chatSelected,
      Assets.chatUnselected,
      const ChatScreen(),
      label: EnumScreenName.chat,
      title: 'Chat',
    ),
    NavBarItem(
      Assets.profileSelected,
      Assets.profileUnselected,
      const ProfileScreen(),
      label: EnumScreenName.profile,
      title: 'Profil',
    ),
  ];

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final keyboardIsOpened = bottomPadding != 0.0;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: BlocBuilder<BottomNavigationProvider, EnumScreenName>(
        builder: (context, state) {
          return SizedBox(
            width: 390.w,
            height: 844.h,
            child: items[getBodyIndex(state)].view,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<TabControllerCubit, TabControllerState>(
        builder: (context, state) {
          return CustomBottomBar(
            items: items,
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<BottomNavigationProvider, EnumScreenName>(
        builder: (context, state) {
          return FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            onPressed: () {
              context
                  .read<BottomNavigationProvider>()
                  .changeScreen(EnumScreenName.notifs);
            },
            child: CenteredFloatingActionButton(
              isSelected: state == EnumScreenName.notifs,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CenteredFloatingActionButton extends StatelessWidget {
  const CenteredFloatingActionButton({
    required this.isSelected,
    super.key,
  });
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return HexagonFAB(
      size: 70,
      icon: isSelected ? Assets.menuSelected : Assets.menuUnselected,
      radiusColor: kcLightGreyColor,
      elevation: 2,
      elevationColor: kcLightGreyColor,
    );
  }
}
