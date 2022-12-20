import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItem {
  NavBarItem(this.selectedIconPath, this.unSelectedIconPath, this.view,
      {required this.label});

  final String selectedIconPath;
  final String unSelectedIconPath;
  final Widget view;
  final EnumScreenName label;
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.items});
  // static int selectedIndex = 0;
  final List<NavBarItem> items;
  @override
  Widget build(BuildContext context) {
    final bottomData =
        BlocProvider.of<BottomNavigationProvider>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
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
          height: 50.h,
          child: BottomAppBar(
            color: Colors.white,
            // shape: const CircularNotchedRectangle(),
            // notchMargin: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((navBar) {
                final index = items.indexOf(navBar);
                final isSelected = bottomData.state == navBar.label;
                // debugPrint('bottomData: ${bottomData.state}');
                final icon = isSelected
                    ? navBar.selectedIconPath
                    : navBar.unSelectedIconPath;
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 1 ? 30 : 0,
                    left: index == 2 ? 30 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (!isSelected) {
                        context
                            .read<BottomNavigationProvider>()
                            .changeScreen(navBar.label);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isSelected == true) verticalSpaceTiny,
                        SvgPicture.asset(
                          icon,
                          width: 24.w,
                          height: 24.h,
                        ),
                        if (isSelected == true)
                          SizedBox(
                            height: 7.h,
                          ),
                        if (isSelected == true) makeUnderline(),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Container makeUnderline() {
    return Container(
      height: 2.h,
      width: 25.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kcPrimaryColor),
    );
  }
}
