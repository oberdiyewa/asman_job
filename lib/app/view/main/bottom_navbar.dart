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
                    debugPrint('Home basyldy');
                    bottomData.changeScreen(EnumScreenName.home);
                  },
                  child: SvgPicture.asset(
                    Assets.homeIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                InkWell(
                  onTap: () {
                    debugPrint('Search basyldy');
                    bottomData.changeScreen(EnumScreenName.search);
                  },
                  child: SvgPicture.asset(
                    Assets.searchIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    bottomData.changeScreen(EnumScreenName.notifs);
                  },
                  child: SvgPicture.asset(
                    Assets.personIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                InkWell(
                  onTap: () {
                    bottomData.changeScreen(EnumScreenName.profile);
                  },
                  child: SvgPicture.asset(
                    Assets.giftIcon,
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
