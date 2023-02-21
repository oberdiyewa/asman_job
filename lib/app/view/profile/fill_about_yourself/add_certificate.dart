import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCertificateScreen extends StatefulWidget {
  const AddCertificateScreen({super.key});

  @override
  State<AddCertificateScreen> createState() => _AddCertificateScreenState();
}

class _AddCertificateScreenState extends State<AddCertificateScreen> {
  TextStyle hintStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kcLightGreyColor,
  );

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
            'Sertifikat Goş',
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
                customHeight: 208,
                widget: Column(
                  children: [
                    borderLinedContainer(
                        width: 339,
                        widget: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Sertifikadyň ady',
                              hintStyle: hintStyle,),
                        ),),
                    verticalSpaceSmall,
                    borderLinedContainer(
                      width: 339,
                      widget: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Haýsy edara tarapyndan berildi',
                            hintStyle: hintStyle,),
                      ),
                    ),
                    verticalSpaceSmall,
                    borderLinedContainer(
                      width: 339,
                      widget: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Berlen wagty',
                          hintStyle: hintStyle,
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: SvgPicture.asset(Assets.calendarIcon),
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
        ),);
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
