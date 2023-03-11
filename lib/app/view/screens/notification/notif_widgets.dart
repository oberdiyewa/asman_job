import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      padding: REdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 1.2,
            offset: Offset(0, 0.6),
          )
        ],
      ),
      child: SvgPicture.asset(Assets.phone),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.w,
        height: 30.h,
        padding: REdgeInsets.symmetric(vertical: 4, horizontal: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 1.2,
              offset: Offset(0, 0.6),
            )
          ],
        ),
        child: SvgPicture.asset(Assets.addIcon),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    required this.valueNotifier,
    super.key,
  });

  final ValueNotifier<int> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 5),
              child: BoxText.headline(
                '$value gün',
                color: kcPrimaryColor,
              ),
            );
          },
        ),
        Theme(
          data: Theme.of(context).copyWith(
            sliderTheme:
                const SliderThemeData(valueIndicatorColor: kcPrimaryColor),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return Slider(
                value: value.toDouble(),
                max: 60,
                divisions: 60,
                thumbColor: kcPrimaryColor,
                activeColor: kcPrimaryColor,
                min: 1,
                label: '$value gün',
                onChanged: (double value) {
                  valueNotifier.value = value.toInt();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class JobAlertDialog extends StatelessWidget {
  const JobAlertDialog({
    required this.button1,
    required this.contentText,
    this.button2,
    super.key,
  });

  final Widget button1;
  final Widget contentText;
  final Widget? button2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      content: SizedBox(
        width: 160,
        height: 80,
        child: Center(child: contentText),
      ),
      actions: (button2 == null) ? [button1] : [button1, button2!],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsPadding: const EdgeInsets.only(bottom: 15),
      elevation: 5,
      scrollable: true,
    );
  }
}

class CustomInputField extends StatelessWidget {
  CustomInputField({
    required this.controller,
    super.key,
    this.placeholder = '',
    this.leading,
    this.trailing,
    // this.height = 45,
    this.width = 85,
    this.borderColor = kcHardGreyColor,
    this.trailingtapped,
    this.password = false,
  });
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingtapped;
  final bool password;
  final Color? borderColor;
  // final double? height;
  final double? width;
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: height?.h,
      width: width?.w,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        style: const TextStyle(height: 1),
        obscureText: password,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            color: kcPrimaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          filled: true,
          fillColor: kcSecondaryTextColor,
          prefixIcon: leading,
          suffixIcon: trailing != null
              ? GestureDetector(
                  onTap: trailingtapped,
                  child: trailing,
                )
              : null,
          border: circularBorder.copyWith(
            borderSide: BorderSide(color: borderColor!),
          ),
          errorBorder: circularBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedBorder: circularBorder.copyWith(
            borderSide: const BorderSide(color: kcPrimaryColor),
          ),
          enabledBorder: circularBorder.copyWith(
            borderSide: const BorderSide(color: kcLightGreyColor),
          ),
        ),
      ),
    );
  }
}

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({
    required this.widget,
    super.key,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(241, 241, 241, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.empty),
          verticalSpaceLarge,
          verticalSpaceSmall,
          Padding(
            padding: REdgeInsets.only(left: 60, right: 60, bottom: 40),
            child: const Text(
              'Siz entek mahabat goýmadyňyz. Mugt gözleýän işiňiz ýa-da işgäriňiz üçin derrew mahabat ýerleşdirip bilersiňiz.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          BoxButton.large(
            title: 'Bildiriş ber',
            onTap: () {
              debugPrint('bildirish ber');
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => widget,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
