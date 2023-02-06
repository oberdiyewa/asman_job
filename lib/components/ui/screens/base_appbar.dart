import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/view/helpers.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppbar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ColoredBox(
          color: Colors.transparent,
          child: Padding(
            padding: REdgeInsets.all(20),
            child: SvgPicture.asset(
              Assets.backIcon,
            ),
          ),
        ),
      ),
      title: BoxText.headline(
        title,
        color: kcSecondaryTextColor,
      ),
      centerTitle: true,
      backgroundColor: kcPrimaryColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
