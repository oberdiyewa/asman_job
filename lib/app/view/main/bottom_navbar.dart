import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../helpers.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});
  static int selectedIndex = 0;
  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    final bottomData =
        BlocProvider.of<BottomNavigationProvider>(context, listen: true);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: SizedBox(
          width: screenWidth(context),
          height: 50,
          child: BottomAppBar(
            color: Colors.white,
            // shape: const CircularNotchedRectangle(),
            // notchMargin: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    debugPrint('Home tapped');

                    bottomData.changeScreen(EnumScreenName.home);
                  },
                  child: SvgPicture.asset(
                    MyAsset.homeIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                InkWell(
                  onTap: () {
                    CustomBottomBar.selectedIndex = 1;
                    debugPrint('Search tapped');
                    GoRouter.of(context).push('/login');

                    debugPrint('Search basyldy');
                    bottomData.changeScreen(EnumScreenName.search);
                  },
                  child: SvgPicture.asset(
                    MyAsset.searchIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    CustomBottomBar.selectedIndex = 2;
                    debugPrint('Bookmarks tapped');

                    bottomData.changeScreen(EnumScreenName.notifs);
                  },
                  child: SvgPicture.asset(
                    MyAsset.personIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                InkWell(
                  onTap: () {
                    debugPrint('Profile tapped');
                    CustomBottomBar.selectedIndex = 3;

                    bottomData.changeScreen(EnumScreenName.profile);
                  },
                  child: SvgPicture.asset(
                    MyAsset.giftIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}