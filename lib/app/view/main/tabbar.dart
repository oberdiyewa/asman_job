import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key, this.tabController});
  final TabController? tabController;
  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Align(
        alignment: Alignment.topCenter,
        child: Expanded(
          child: Container(
            width: 385.w,
            height: 40.h,
            padding: REdgeInsets.only(right: 4, left: 4, top: 4, bottom: 4).w,
            margin: const EdgeInsets.only(top: 10).w,
            decoration: BoxDecoration(
              color: kcSecondaryTextColor,
              borderRadius: BorderRadius.circular(20).w,
            ),
            child: TabBar(
              labelColor: kcSecondaryColor,
              unselectedLabelColor: kcHardGreyColor,
              indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).w,
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
                        Assets.searchWorkIcon,
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
                        Assets.personGreyIcon,
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
      ),
    );
  }
}
