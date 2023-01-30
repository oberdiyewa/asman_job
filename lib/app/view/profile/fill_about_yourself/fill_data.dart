import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_phone.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_profession.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/app/view/profile/fill_about_yourself/add_education.dart';
import 'package:asman_work/app/view/profile/fill_about_yourself/add_experience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FillDataAboutYourself extends StatefulWidget {
  const FillDataAboutYourself({super.key});

  @override
  State<FillDataAboutYourself> createState() => _FillDataAboutYourselfState();
}

class _FillDataAboutYourselfState extends State<FillDataAboutYourself> {
  TextStyle menuStyle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: kcPrimaryColor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: REdgeInsets.all(20.0),
            child: SvgPicture.asset(
              Assets.backIcon,
            ),
          ),
        ),
        title: BoxText.headline(
          'Özüm barada maglumat',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionName(
            headlineWord: 'Iş Tejribesi',
          ),
          AddSection(
            customHeight: 50,
            widget: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const AddExperienceScreen(),
                      ),
                    );
                  },
                  child: const AddButton(),
                ),
                horizontalSpaceTiny,
                const VerticalDivider(),
                horizontalSpaceTiny,
                Text(
                  'Täze Iş Tejribesini Goş',
                  style: menuStyle,
                )
              ],
            ),
          ),
          const SectionName(headlineWord: 'Bilim'),
          AddSection(
            customHeight: 50,
            widget: Row(
              children: [
                InkWell(
                  onTap: () {
                     Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const AddEducationScreen(),
                      ),
                    );
                  },
                  child: AddButton()),
                horizontalSpaceTiny,
                VerticalDivider(),
                horizontalSpaceTiny,
                Text(
                  'Täze Bilim Maglumatyny Goş     ',
                  style: menuStyle,
                )
              ],
            ),
          ),
          const SectionName(
            headlineWord: 'Daşary ýurt dili',
          ),
          AddSection(
            customHeight: 50,
            widget: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const AddButton(),
                ),
                horizontalSpaceTiny,
                VerticalDivider(),
                horizontalSpaceTiny,
                Text(
                  'Täze Dil Goş',
                  style: menuStyle,
                )
              ],
            ),
          ),
          const SectionName(
            headlineWord: 'Sertifikatlar',
          ),
          AddSection(
            customHeight: 50,
            widget: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const AddButton(),
                ),
                horizontalSpaceTiny,
                VerticalDivider(),
                horizontalSpaceTiny,
                Text(
                  'Täze Sertifikat Goş',
                  style: menuStyle,
                )
              ],
            ),
          ),
          const SectionName(
            headlineWord: 'Zehin we ussatlyk',
          ),
          AddSection(
            customHeight: 50,
            widget: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const AddButton(),
                ),
                horizontalSpaceTiny,
                VerticalDivider(),
                horizontalSpaceTiny,
                Text(
                  'Täze Başarnyk Goş',
                  style: menuStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
