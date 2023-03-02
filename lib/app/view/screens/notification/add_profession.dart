import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/notification/add_profile/add_profile_screen.dart';
import 'package:asman_work/app/view/screens/notification/notif_widgets.dart';
import 'package:asman_work/app/view/screens/notification/section_add.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProfession extends StatefulWidget {
  const AddProfession({
    super.key,
  });

  @override
  State<AddProfession> createState() => _AddProfessionState();
}

class _AddProfessionState extends State<AddProfession> {
  late final TextEditingController _textController;
  late final ProfileValueNotifiers notifiers;

  @override
  void initState() {
    notifiers = ProfileValueNotifiers.instance!;
    _textController =
        TextEditingController(text: notifiers.professionValue.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: JobBaseAppbar(
          title: 'Wezipe goş',
          onBack: () {
            Navigator.pop(context, _textController.text);
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddSection(
              customHeight: 70,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: REdgeInsets.only(),
                    child: SizedBox(
                      height: 50.h,
                      width: 380.w,
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            width: 17.w,
                            height: 17.h,
                            margin: EdgeInsets.only(
                              right: 14.w,
                              left: 12.w,
                            ),
                            child: SvgPicture.asset(
                              Assets.searchNormalIcon,
                            ),
                          ),
                          hintText: 'gözleg',
                          suffix: GestureDetector(
                            onTap: _textController.clear,
                            child: SvgPicture.asset(Assets.clear),
                          ),
                          hintStyle: TextStyle(
                            color: kcHardGreyColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onChanged: (value) {
                          notifiers.professionValue.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SectionName(
              headlineWord: 'Wezipeler',
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: screenWidth(context),
                // height: 585,
                padding: REdgeInsets.only(left: 23, right: 23, top: 10),
                child: ListView.builder(
                  itemCount: professions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _textController.text = professions[index];
                            notifiers.professionValue.value =
                                _textController.text;
                          },
                          child: BoxText.body(professions[index]),
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> professions = [
    'Turkmen dili mugallym',
    'Matematika mugallym',
    'Rus dili mugallym',
    'Nemes dili mugallym',
    'Hytay dili mugallym',
    'Yapon dili mugallym',
    'Iňlis dili mugallym',
  ];
}
