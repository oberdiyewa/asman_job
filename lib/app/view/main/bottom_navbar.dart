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
    return DecoratedBox(
      decoration: const BoxDecoration(
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
          height: 80.h,
          child: BottomAppBar(
            color: Colors.white,
            // shape: const CircularNotchedRectangle(),
            // notchMargin: 2,
            child: BlocBuilder<BottomNavigationProvider, EnumScreenName>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: items.map((navBar) {
                    final index = items.indexOf(navBar);
                    final isSelected = state == navBar.label;
                    // debugPrint('bottomData: ${bottomData.state}');
                    final icon = isSelected
                        ? navBar.selectedIconPath
                        : navBar.unSelectedIconPath;
                    return navBar.label == EnumScreenName.notifs
                        ? Expanded(
                            flex: 3,
                            child: GestureDetector(
                              child: ColoredBox(
                                color: Colors.grey[100]!,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        navBar.title,
                                        style: TextStyle(
                                          color: isSelected
                                              ? kcPrimaryColor
                                              : Colors.grey[700],
                                          fontSize: isSelected ? 18 : 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        : Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                if (!isSelected) {
                                  context
                                      .read<BottomNavigationProvider>()
                                      .changeScreen(navBar.label);
                                }
                              },
                              child: ColoredBox(
                                  color: Colors.grey[100]!,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (isSelected == true) verticalSpaceTiny,
                                      SvgPicture.asset(
                                        icon,
                                        width: 40.w,
                                        height: 40.h,
                                      ),
                                    ],
                                  )),
                            ),
                          );
                  }).toList(),
                );
              },
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
        borderRadius: BorderRadius.circular(10),
        color: kcPrimaryColor,
      ),
    );
  }
}
