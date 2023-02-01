import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.context,
    this.leading,
    required this.title,
    this.trailing,
  }) : super(key: key);

  final BuildContext context;
  final String? leading;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(
        context,
      ),
      height: 35,
      padding: REdgeInsets.symmetric(horizontal: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (leading != null)
                SvgPicture.asset(
                  leading!,
                )
              else
                const SizedBox(),
              SizedBox(
                width: 11.w,
              ),
              BoxText.body(
                title,
              )
            ],
          ),
          if (trailing == null)
            SvgPicture.asset(Assets.arrowForward)
          else
            trailing!
        ],
      ),
    );
  }
}

