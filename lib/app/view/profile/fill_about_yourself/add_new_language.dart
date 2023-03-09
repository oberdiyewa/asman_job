import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification/section_add.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoiceLevel {
  ChoiceLevel(this.name, {this.selected = false});
  final String name;
  final bool? selected;

  ChoiceLevel copy({
    String? name,
    bool? selected,
  }) {
    return ChoiceLevel(name ?? this.name, selected: selected ?? this.selected);
  }
}

TextEditingController textController = TextEditingController();

class AddNewLanguageScreen extends StatefulWidget {
  const AddNewLanguageScreen({super.key});

  @override
  State<AddNewLanguageScreen> createState() => _AddNewLanguageScreenState();
}

class _AddNewLanguageScreenState extends State<AddNewLanguageScreen> {
  TextStyle hintStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kcLightGreyColor,
  );

  bool isChecked = false;

  List<ChoiceLevel> levels = [
    ChoiceLevel('Başlangyç dereje'),
    ChoiceLevel('Orta dereje'),
    ChoiceLevel('Ýokary dereje'),
  ];

  void selectLevel(ChoiceLevel c) {
    final newList = List<ChoiceLevel>.from(levels);

    for (var i = 0; i < newList.length; i++) {
      final item = newList[i];

      if (item.name == c.name && item.selected!) {
        return;
      } else if (item.name == c.name && item.selected == false) {
        newList[i] = item.copy(selected: true);
        continue;
      }

      // unselect all others
      newList[i] = item.copy(selected: false);
    }

    // update state
    levels = newList;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: const BaseAppbar(title: 'Täze Dil Goş'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: REdgeInsets.only(top: 15),
            child: AddSection(
              customHeight: 140,
              widget: Column(
                children: [
                  borderLinedContainer(
                    width: 339,
                    widget: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Dil',
                        hintStyle: hintStyle,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  borderLinedContainer(
                    width: 339,
                    widget: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Dereje saýla',
                        hintStyle: hintStyle,
                        suffixIcon: InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  height: 322.h,
                                  margin: const EdgeInsets.only(
                                    left: 24,
                                    right: 24,
                                  ),
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
                                            borderRadius: BorderRadius.circular(
                                              20.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                      verticalSpaceMedium,
                                      verticalSpaceTiny,
                                      BoxText.headline(
                                        'Dereje saýlaň',
                                        color: kcPrimaryColor,
                                      ),
                                      verticalSpaceMedium,
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      Column(
                                        children: levels.map((e) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRadioWidget<dynamic>(
                                                    isSelected: e.selected!,
                                                    onChanged: () =>
                                                        selectLevel(e),
                                                  ),
                                                  horizontalSpaceSmall,
                                                  Text(e.name),
                                                ],
                                              ),
                                              verticalSpaceTiny
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                      verticalSpaceLarge,
                                      BoxButton.block(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        title: 'Saýla',
                                      )
                                    ],
                                  ),
                                );
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
      ),
    );
  }

  Container borderLinedContainer({
    required Widget widget,
    double width = 60,
  }) {
    return Container(
      width: width.w,
      height: 50.h,
      padding: const EdgeInsets.only(left: 10, bottom: 5),
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


// Draft
// Pending
// Published
// Unpublished
      // Moderation note
// Closed
// Blocked
