import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SectionName extends StatelessWidget {
  const SectionName({super.key, this.headlineWord});

  final String? headlineWord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 16, left: 23, bottom: 16),
      child: BoxText.headline(
        headlineWord!,
        color: kcHardGreyColor,
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      padding: REdgeInsets.symmetric(vertical: 4, horizontal: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 1.2,
            offset: Offset(0, 0.6),
          )
        ],
      ),
      child: SvgPicture.asset(Assets.addIcon),
    );
  }
}
