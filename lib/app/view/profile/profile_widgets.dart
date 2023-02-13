import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers.dart';
import '../notification_screen/section_add.dart';

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
                Row(
                  children: [
                    SvgPicture.asset(
                      leading!,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                  ],
                )
              else
                const SizedBox(),
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

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AddSection(
        widget: Padding(
      padding: REdgeInsets.only(bottom: 5),
      child: BoxButton.block(
        title: title,
        style: heading2Style.copyWith(fontSize: 16),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
