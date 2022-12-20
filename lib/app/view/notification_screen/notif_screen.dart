// ignore: eol_at_end_of_file
import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/notification_screen/applied_section_tabbar.dart';
import 'package:asman_work/app/view/notification_screen/notif_section_tabbar.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    // tabController!.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth(context),
            height: 50.h,
            color: const Color.fromRGBO(51, 67, 152, 1),
            child: Center(
              child: BoxText.headline(
                'Bildiriş',
                color: kcSecondaryTextColor,
              ),
            ),
          ),
          notifScreenTabBar(),
          Expanded(
            child: SizedBox(
              height: screenHeight(context),
              child: TabBarView(
                controller: tabController,
                children: const [
                  NotificationSectionTabbar(),
                  AppliedSectionTabbar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Material notifScreenTabBar() {
    return Material(
      child: Container(
        width: 390.w,
        height: 50.h,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: kcPrimaryColor,
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: kcSecondaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: BoxText.headline(
                'Iş gözleýän',
                color: kcSecondaryTextColor,
              ),
            ),
            Tab(
              child: BoxText.headline(
                'Işgär gözleýän',
                color: kcSecondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
