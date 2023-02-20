import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 123.w,
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kcPrimaryColor, borderRadius: BorderRadius.circular(10),),
        child: const Text(
          'Salam, Läle!',
          style: TextStyle(
            color: kcSecondaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class FindMyLocationWidget extends StatelessWidget {
  const FindMyLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 50.w,
        height: 50.h,
        padding: REdgeInsets.all(12),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(child: SvgPicture.asset(Assets.showLocation)),
      ),
    );
  }
}

class CustomRadioWidget<T> extends StatelessWidget {
  const CustomRadioWidget({
    required this.isSelected,
    required this.onChanged,
    // required this.value,
    // required this.groupValue,
    // required this.onChanged,
    this.width = 16,
    this.height = 16,
    super.key,
  });
  // final T value;
  // final T groupValue;
  final VoidCallback? onChanged;
  final double width;
  final double height;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        margin: REdgeInsets.only(top: 5, bottom: 5),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(1, 1, 1, 0.25),
              blurRadius: 1.4,
              offset: Offset(0, 0.7),
            )
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            height: height - 5,
            width: width - 5,
            decoration: ShapeDecoration(
              color: isSelected == true ? kcPrimaryColor : Colors.white,
              shape: const CircleBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
