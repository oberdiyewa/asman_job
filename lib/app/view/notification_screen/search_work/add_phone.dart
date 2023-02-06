import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController textController = TextEditingController();

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  bool isCurrentNumber = false;
  bool isEnableButton = false;
  @override
  @override
  Widget build(BuildContext context) {
    var _textController = TextEditingController();
    debugPrint(isEnableButton.toString());
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: const BaseAppbar(title: 'Telefon belgi goş'),
        body: Column(
          children: [
            verticalSpaceSmall,
            verticalSpaceTiny,
            AddSection(
              customHeight: 220,
              widget: Padding(
                padding: REdgeInsets.only(top: 14, bottom: 16),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        borderLinedContainer(
                          widget: const Text(
                            '993',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        horizontalSpaceTiny,
                        borderLinedContainer(
                          width: 270,
                          widget: Padding(
                            padding: const EdgeInsets.only(bottom: 7, left: 10),
                            child: TextField(
                              onChanged: (String phoneNumber) {
                                phoneNumber.length >= 8
                                    ? isEnableButton = true
                                    : isEnableButton = false;
                                debugPrint('isEnableButton:$isEnableButton');
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: textController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        CustomRadioWidget<dynamic>(
                            isSelected: isCurrentNumber,
                            onChanged: () {
                              isCurrentNumber = !isCurrentNumber;
                              (isCurrentNumber) && (isEnableButton == false)
                                  ? isEnableButton = true
                                  : isEnableButton = false;

                              debugPrint(isCurrentNumber.toString() +
                                  isEnableButton.toString());
                              setState(() {});
                            }),
                        horizontalSpaceSmall,
                        horizontalSpaceTiny,
                        BoxText.body('Häzirki belgini ulan'),
                      ],
                    ),
                    verticalSpaceRegular,
                    BoxButton.block(
                      title: 'Belgini goş',
                      disabled: !isEnableButton,
                      onTap: () {
                        Navigator.pop(context, '+99365010101');
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Container borderLinedContainer({
    required Widget widget,
    double width = 60,
  }) {
    return Container(
      width: width.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kcLightestGreyColor, width: 2)),
      child: Center(
        child: widget,
      ),
    );
  }
}
