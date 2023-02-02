import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/app/view/profile/fill_about_yourself/add_experience/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController textController = TextEditingController();

class AddExperienceScreen extends StatefulWidget {
  const AddExperienceScreen({super.key});

  @override
  State<AddExperienceScreen> createState() => _AddExperienceScreenState();
}

class _AddExperienceScreenState extends State<AddExperienceScreen> {
  TextStyle hintStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kcLightGreyColor,
  );

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: REdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.backIcon,
              ),
            ),
          ),
          title: BoxText.headline(
            'Iş Tejribesi Goş',
            color: kcSecondaryTextColor,
          ),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: REdgeInsets.only(top: 15),
              child: AddSection(
                customHeight: 260,
                widget: Column(
                  children: [
                    borderLinedContainer(
                        width: 339,
                        widget: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Işlän wezipäňiz ',
                              hintStyle: hintStyle),
                        )),
                    verticalSpaceSmall,
                    borderLinedContainer(
                        width: 339,
                        widget: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Işlän edaraňyz',
                            hintStyle: hintStyle,
                          ),
                        )),
                    verticalSpaceSmall,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        borderLinedContainer(
                          width: 160,
                          widget: TextField(
                            // enabled: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Işe başlan wagty',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () => _selectDate(context),
                                    child:
                                        SvgPicture.asset(Assets.calendarIcon)),
                              ),
                              hintStyle: hintStyle.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        horizontalSpaceRegular,
                        borderLinedContainer(
                          width: 160,
                          widget: TextField(
                            // enabled: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Işden çykan wagty',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8),
                                child: InkWell(
                                    onTap: () => _selectDate(context),
                                    child:
                                        SvgPicture.asset(Assets.calendarIcon)),
                              ),
                              hintStyle: hintStyle.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        Checkbox(
                            activeColor: kcPrimaryColor,
                            side: const BorderSide(
                                width: 1.5, color: kcLightGreyColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        BoxText.headline('Entagem işläp ýörn')
                      ],
                    )
                  ],
                ),
              ),
            ),
            const AddSection(
              widget: BoxButton.block(
                title: 'Ýatda sakla',
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
      padding: EdgeInsets.only(left: 10, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kcLightestGreyColor, width: 2)),
      child: Center(
        child: widget,
      ),
    );
  }

  void saveExperience() {
    final userExp = WorkExperience(
      'Asmanpay',
      DateTime.now(),
      DateTime.now(),
      true,
      jobTitle: 'developer',
    );
    Navigator.pop(context, userExp);
  }
}
