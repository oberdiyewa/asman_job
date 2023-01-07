import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../notification_screen/notif_widgets.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: REdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.backIcon,
              ),
            ),
          ),
          title: BoxText.headline(
            'Tertiple',
            color: kcSecondaryTextColor,
          ),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
        ),
        body: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('data'),
            ]));
  }
}
