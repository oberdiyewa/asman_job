import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({super.key, this.icon, this.label, this.isVersion});
  final String? icon;
  final String? label;
  final bool? isVersion;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          SizedBox(
            width: screenWidth(context) * 0.05,
            child: SvgPicture.asset(icon!),
          ),
        if (icon == null)
          SizedBox(
            width: screenWidth(context) * 0.05,
          ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxText.headingTwo(label!),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              )
            ],
          ),
        )
      ],
    );
  }
}
