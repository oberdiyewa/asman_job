import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../notification_screen/notif_widgets.dart';

enum SelectedPlace {
  ashgabat,
  dashoguz,
  mary,
  lebap,
  balkan,
  ahal,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isRecentNotifsFirst = false;
  bool isOldNotifsFirst = false;
  bool isSortByPlace = false;

  SelectedPlace? _place = SelectedPlace.ashgabat;
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
          'Tertiple',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          verticalSpaceTiny,
          AddSection(
            customHeight: 368,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: kcPrimaryColor, width: 2),
                      checkColor: Colors.white,
                      activeColor: kcPrimaryColor,
                      onChanged: (bool? value) {
                        setState(() {
                          isRecentNotifsFirst = value!;
                        });
                      },
                      value: isRecentNotifsFirst,
                    ),
                    // horizontalSpaceSmall,
                    const Text(
                      'Soňky bildirişler öňde goý',
                      style: TextStyle(
                        color: kcPrimaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                // verticalSpaceRegular,
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: kcPrimaryColor, width: 2),
                      checkColor: Colors.white,
                      activeColor: kcPrimaryColor,
                      onChanged: (bool? value) {
                        setState(() {
                          isOldNotifsFirst = value!;
                        });
                      },
                      value: isOldNotifsFirst,
                    ),
                    // horizontalSpaceSmall,
                    const Text(
                      'Öňki bildirişleri öňde goý',
                      style: TextStyle(
                        color: kcPrimaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: kcPrimaryColor, width: 2),
                      checkColor: Colors.white,
                      activeColor: kcPrimaryColor,
                      onChanged: (bool? value) {
                        setState(() {
                          isSortByPlace = value!;
                        });
                      },
                      value: isSortByPlace,
                    ),
                    // horizontalSpaceSmall,
                    const Text(
                      'Ýerleşýän ýeri boýunça tertiple',
                      style: TextStyle(
                        color: kcPrimaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: REdgeInsets.only(left: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio<SelectedPlace>(
                            activeColor: kcPrimaryColor,
                            value: SelectedPlace.ashgabat,
                            groupValue: _place,
                            onChanged: (SelectedPlace? value) {
                              setState(() {
                                _place = value;
                              });
                            },
                          ),
                          // horizontalSpaceSmall,
                          const Text(
                            'Aşgabat',
                            style:
                                TextStyle(color: kcHardGreyColor, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<SelectedPlace>(
                            activeColor: kcPrimaryColor,
                            value: SelectedPlace.ahal,
                            groupValue: _place,
                            onChanged: (SelectedPlace? value) {
                              setState(() {
                                _place = value;
                              });
                            },
                          ),
                          // horizontalSpaceSmall,
                          const Text(
                            'Ahal',
                            style:
                                TextStyle(color: kcHardGreyColor, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
