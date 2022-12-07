import 'package:asman_flutter_uikit/box_ui2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key, this.tabController});
  final TabController? tabController;
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 350,
          height: 40,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: kcSecondaryTextColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TabBar(
            labelColor: kcSecondaryColor,
            unselectedLabelColor: kcHardGreyColor,
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: kcPrimaryColor,
            ),
            controller: widget.tabController,
            tabs: [
              Tab(
                // text: 'Iş gözleýän',
                child: Row(
                  children: [
                    SvgPicture.asset(
                      MyAsset.searchWorkIcon,
                      color: widget.tabController!.index == 0
                          ? kcSecondaryColor
                          : kcHardGreyColor,
                    ),
                    horizontalSpaceRegular,
                    BoxText.headline('Iş gözleýän')
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      MyAsset.personGreyIcon,
                      color: widget.tabController!.index == 1
                          ? kcSecondaryColor
                          : kcHardGreyColor,
                    ),
                    horizontalSpaceRegular,
                    BoxText.headline('Işgär gözleýän'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
