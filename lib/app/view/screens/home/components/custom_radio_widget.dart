import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
