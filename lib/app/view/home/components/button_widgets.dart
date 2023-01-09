import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123.w,
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kcPrimaryColor, borderRadius: BorderRadius.circular(10)),
      child: const Text(
        'Salam, Läle!',
        style: TextStyle(
          color: kcSecondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class FindMyLocationWidget extends StatelessWidget {
  const FindMyLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      padding: REdgeInsets.all(12),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Center(child: SvgPicture.asset(Assets.showLocation)),
    );
  }
}

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  const CustomRadioWidget(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      this.width = 32,
      this.height = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(this.value);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            gradient: LinearGradient(
              colors: [
                Color(0xFF49EF3E),
                Color(0xFF06D89A),
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: this.height - 8,
              width: this.width - 8,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                gradient: LinearGradient(
                  colors: value == groupValue
                      ? [
                          Color(0xFFE13684),
                          Color(0xFFFF6EEC),
                        ]
                      : [
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
