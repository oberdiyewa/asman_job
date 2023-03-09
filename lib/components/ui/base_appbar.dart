import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobBaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const JobBaseAppbar({
    required this.title,
    required this.onBack,
    super.key,
    this.actions,
    this.bottom,
  });
  final String title;
  final VoidCallback onBack;
  final List<Widget>? actions;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: onBack,
        child: ColoredBox(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                Assets.backIcon,
              ),
            ),
          ),
        ),
      ),
      title: BoxText.headline(
        title,
        color: kcSecondaryTextColor,
      ),
      centerTitle: true,
      actions: actions,
      // ignore: prefer_const_constructors
      bottom: bottom == null
          ? null
          : PreferredSize(preferredSize: preferredSize, child: bottom!),
    );
  }

  @override
  Size get preferredSize =>
      bottom == null ? AppBar().preferredSize : AppBar().preferredSize * 2;
}
