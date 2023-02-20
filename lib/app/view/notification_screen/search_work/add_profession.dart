import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddProfession extends StatefulWidget {
  const AddProfession({super.key});

  @override
  State<AddProfession> createState() => _AddProfessionState();
}

class _AddProfessionState extends State<AddProfession> {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
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
          'Wezipe goş',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
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
                  padding: REdgeInsets.only(
                      // top: 10,
                      // left: 10,
                      // right: 10,
                      ),
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
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10).w,
                        // ),
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
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.pop<String>(context, 'Iňlis dili mugallym '),
                        child: BoxText.body('Iňlis dili mugallym'),
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
    );
  }
}
