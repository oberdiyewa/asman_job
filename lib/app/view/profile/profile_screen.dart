import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth(context),
            height: 50.h,
            color: kcPrimaryColor,
            child: Center(
              child: BoxText.headline(
                'Profile',
                color: kcSecondaryTextColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context),
              color: const Color.fromRGBO(241, 241, 241, 1),
              child: Column(
                children: [
                  verticalSpaceRegular,
                  AddSection(
                    widget: Container(
                        width: 322.w,
                        height: 69.h,
                        alignment: Alignment.center,
                        padding:
                            REdgeInsets.symmetric(vertical: 11, horizontal: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kcLightestGreyColor,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(Assets.profileBig),
                            horizontalSpaceMedium,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BoxText.headline('Berdiyewa Oguljemal'),
                                BoxText.subheading(
                                    'Ýetmeýän maglumatlaryňyzy dolduryň', color: kcHardGreyColor,),
                              ],
                            )
                          ],
                        )),
                  ), verticalSpaceMedium,
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
