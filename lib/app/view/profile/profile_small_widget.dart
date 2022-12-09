import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/profile/profile_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSmallWidget extends StatelessWidget {
  const ProfileSmallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight(context) * 0.025,
      ),
      width: screenWidth(context),
      padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.025,
          horizontal: screenWidth(context) * 0.025),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 0.3,
            spreadRadius: 0.6,
            offset: Offset(0, 3),
            color: kcLightGreyColor)
      ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(context) * 0.025,
              horizontal: screenWidth(context) * 0.025,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kcLightestGreyColor,
            ),
            width: screenWidth(context) * 0.9,
            height: screenHeight(context) * 0.13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: screenWidth(context) * 0.025,
                          right: screenWidth(context) * 0.05),
                      child: SvgPicture.asset(
                        Assets.profileBig,
                        width: screenWidth(context) * 0.05,
                        height: screenHeight(context) * 0.06,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: screenWidth(context) * 0.9,
                        height: screenHeight(context) * 0.06,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoxText.headingTwo('Profile barada ginisleyin'),
                            FittedBox(
                                child: BoxText.subheading(
                              'Yetmeyan maglumatlarynyzy dolduryn',
                              color: kcLightGreyColor,
                            )),
                            Expanded(
                              child: Row(children: [
                                SizedBox(
                                  width: screenWidth(context) * 0.5,
                                  child: LinearProgressIndicator(
                                    minHeight: screenHeight(context) * 0.01,
                                    value: 0,
                                    color: kcSecondaryColor,
                                  ),
                                ),
                                BoxText.subheading(' %0',
                                    color: kcLightGreyColor)
                              ]),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ProfileOptionWidget(
            isVersion: false,
            label: 'Profile ginisleyin gor',
          )
        ],
      ),
    );
  }
}
