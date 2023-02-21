import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobBaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const JobBaseAppbar({
    required this.title,
    super.key,
  });
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
  Size get preferredSize => AppBar().preferredSize;
}
