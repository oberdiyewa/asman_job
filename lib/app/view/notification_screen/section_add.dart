import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSection extends StatelessWidget {
  const AddSection({super.key, this.widget, this.onTap});
  final Widget? widget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: screenWidth(context),
          height: 80.h,
          padding: REdgeInsets.only(top: 10, bottom: 10, left: 23, right: 28),
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
