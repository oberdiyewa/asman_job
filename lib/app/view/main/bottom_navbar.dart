import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItem {
  NavBarItem(
    this.selectedIconPath,
    this.unSelectedIconPath,
    this.view, {
    required this.label,
    required this.title,
  });

  final String selectedIconPath;
  final String unSelectedIconPath;
  final Widget view;
  final EnumScreenName label;
  final String title;
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    required this.items,
    super.key,
  });

  // static int selectedIndex = 0;
  final List<NavBarItem> items;

  @override
  Widget build(BuildContext context) {
    final bottomData =
        BlocProvider.of<BottomNavigationProvider>(context, listen: true);

    final children = items.map<Widget>((navBar) {
      final isSelected = bottomData.state == navBar.label;
      // debugPrint('bottomData: ${bottomData.state}');
      final icon =
          isSelected ? navBar.selectedIconPath : navBar.unSelectedIconPath;

      return navBar.label == EnumScreenName.notifs
          ? Expanded(
              flex: 3,
              child: Column(
                children: const [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Bildiriş goş',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: kcPrimaryColor,
                    ),
                  ),
                  Spacer()
                ],
              ),
            )
          : Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  print('tapped yeah');
                  if (!isSelected) {
                    context
                        .read<BottomNavigationProvider>()
                        .changeScreen(navBar.label);
                  }
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //if (isSelected == true) verticalSpaceTiny,
                      SvgPicture.asset(
                        icon,
                        width: 31.w,
                        height: 34.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
    }).toList();

    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 2)
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          width: screenWidth(context),
          height: 80.h,
          child: BottomAppBar(
            color: Colors.white,
            // shape: const CircularNotchedRectangle(),
            // notchMargin: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
