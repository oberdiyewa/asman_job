import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSection extends StatelessWidget {
  const AddSection({
    super.key,
    this.widget,
    this.onTap,
    this.customHeight = 80,
    this.hasChildren = false,
    this.bottomPadding = 10,
    this.topPadding = 10,
    this.leftPadding = 23,
    this.rightPadding = 28,
  });
  final Widget? widget;
  final VoidCallback? onTap;
  final double? bottomPadding;
  final double customHeight;
  final bool hasChildren;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: screenWidth(context),
          height: hasChildren ? null : customHeight.h,
          padding: REdgeInsets.only(
            top: topPadding!,
            bottom: bottomPadding!,
            left: leftPadding!,
            right: rightPadding!,
          ),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 254, 254, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 2,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: widget),
    );
  }
}
