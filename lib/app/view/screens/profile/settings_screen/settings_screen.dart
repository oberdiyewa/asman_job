import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/notification/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController _textController = TextEditingController();

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextStyle hintStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kcLightGreyColor,
  );

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: REdgeInsets.all(20),
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
          'Sazlamalar',
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
            padding: const EdgeInsets.only(top: 15),
            child: AddSection(
              customHeight: 400,
              widget: Column(
                children: [
                  verticalSpaceMedium,
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        // backgroundColor: kcPrimaryColor,
                        backgroundImage: AssetImage(Assets.avatar),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 7,
                        child: Container(
                          width: 33.w,
                          height: 33.h,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: kcLightGreyColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SvgPicture.asset(Assets.camera),
                        ),
                      )
                    ],
                  ),
                  verticalSpaceSmall,
                  verticalSpaceSmall,
                  borderLinedContainer(
                    width: 339,
                    widget: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ady',
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
                        hintText: 'Familiyasy',
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
                        hintText: 'e-mail salgy',
                        hintStyle: hintStyle,
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
