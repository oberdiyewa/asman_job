import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: REdgeInsets.all(20.0),
          child: SvgPicture.asset(
            Assets.backIcon,
          ),
        ),
        title: BoxText.headline(
          'Bildiriş ber',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionName(
            headlineWord: 'Bildiriş görnüşi',
          ),
          AddSection(
            widget: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  // margin: REdgeInsets.only(left: 23),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcPrimaryColor,
                    // borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                ),
                horizontalSpaceSmall,
                horizontalSpaceTiny,
                BoxText.body('Işgär gözleýän')
              ],
            ),
          ),
          const SectionName(
            headlineWord: 'Ady',
          ),
          AddSection(
            widget: SizedBox(
              height: 50.h,
              width: 339.w,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kcLightestGreyColor,
                    ),
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                  hintText: 'Ýazyň...',
                  contentPadding: REdgeInsets.only(left: 34),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).w,
                    borderSide: const BorderSide(
                      color: kcHardGreyColor,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: kcHardGreyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const SectionName(
            headlineWord: 'Giňişleýin adressiňiz',
          ),
          AddSection(
            widget: Row(
              children: [
                AddButton(),
                horizontalSpaceSmall,
                horizontalSpaceSmall,
                BoxText.headline(
                  'Adress goş',
                  color: kcPrimaryColor,
                )
              ],
            ),
          ),
          const SectionName(headlineWord: 'Telefon belgi goş '),
          AddSection(
              widget: Row(
                children: [
                  AddButton(),
                  horizontalSpaceSmall,
                  horizontalSpaceSmall,
                  BoxText.headline(
                    'Telefon belgi goş',
                    color: kcPrimaryColor,
                  )
                ],
              ),
              onTap: () {}),
          const SectionName(headlineWord: 'Wezipän ady'),
          AddSection(
            widget: Row(
              children: [
                AddButton(),
                horizontalSpaceSmall,
                horizontalSpaceSmall,
                BoxText.headline(
                  'Wezipe goş',
                  color: kcPrimaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
