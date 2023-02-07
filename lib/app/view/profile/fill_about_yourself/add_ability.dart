import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_new_language.dart';

class AddAbilityScreen extends StatefulWidget {
  const AddAbilityScreen({super.key});

  @override
  State<AddAbilityScreen> createState() => _AddAbilityScreenState();
}

class _AddAbilityScreenState extends State<AddAbilityScreen> {
  TextStyle hintStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kcLightGreyColor,
  );

  bool isChecked = false;

  List<ChoiceLevel> timeLevels = [
    ChoiceLevel('5 aý'),
    ChoiceLevel('6 aý'),
    ChoiceLevel('1 ýyl'),
    ChoiceLevel('2 ýyl'),
    ChoiceLevel('3 ýyl'),
    ChoiceLevel('4 ýyl'),
    ChoiceLevel('5 ýyl'),
    ChoiceLevel('5 ýyl we ondan köp'),
  ];

  void selectTimeLevel(ChoiceLevel c) {
    final newList = List<ChoiceLevel>.from(timeLevels);

    for (var i = 0; i < newList.length; i++) {
      final item = newList[i];

      if (item.name == c.name && item.selected == true) {
        return;
      } else if (item.name == c.name && item.selected == false) {
        newList[i] = item.copy(selected: true);
        continue;
      }

      // unselect all others
      newList[i] = item.copy(selected: false);
    }

    // update state
    timeLevels = newList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: const BaseAppbar(title: 'Başarnyk Goş'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: REdgeInsets.only(top: 15),
              child: AddSection(
                customHeight: 161,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    borderLinedContainer(
                        width: 339,
                        widget: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Zehin ýada başarnyk ýaz ',
                              hintStyle: hintStyle),
                        )),
                    verticalSpaceSmall,
                    Text(
                      'Meselem: Surat çekmek, Excel',
                      style: hintStyle.copyWith(fontSize: 12),
                    ),
                    verticalSpaceSmall,
                    borderLinedContainer(
                      width: 339,
                      widget: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tejribe',
                          hintStyle: hintStyle,
                          suffixIcon: InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return Container(
                                      height: 430.h,
                                      margin: const EdgeInsets.only(
                                          left: 24, right: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                top: 13.h,
                                              ),
                                              width: 50.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                color: kcLightGreyColor,
                                                borderRadius:
                                                    BorderRadius.circular(20.w),
                                              ),
                                            ),
                                          ),
                                          verticalSpaceTiny,
                                          verticalSpaceSmall,
                                          BoxText.headline(
                                            'Dereje saýlaň',
                                            color: kcPrimaryColor,
                                          ),
                                          verticalSpaceSmall,
                                          const Divider(
                                            thickness: 2,
                                          ),
                                          Column(
                                            children: timeLevels.map((e) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomRadioWidget<
                                                              dynamic>(
                                                          isSelected:
                                                              e.selected!,
                                                          onChanged: () {
                                                            selectTimeLevel(e);
                                                            setState(() {});
                                                          }),
                                                      horizontalSpaceSmall,
                                                      Text(e.name),
                                                    ],
                                                  ),
                                                  verticalSpaceTiny
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                          verticalSpaceRegular,
                                          BoxButton.block(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            title: 'Saýla',
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset(Assets.arrowDown),
                            ),
                          ),
                        ),
                      ),
                    ),
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
        border: Border.all(color: kcLightestGreyColor, width: 2),
      ),
      child: Center(
        child: widget,
      ),
    );
  }
}
