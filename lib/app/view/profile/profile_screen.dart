import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/profile/profile_small_widget.dart';
import 'package:flutter/material.dart';

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
            alignment: Alignment.center,
            width: screenWidth(context),
            height: screenHeight(context) * 0.07,
            child: BoxText.headingTwo('Profile', color: Colors.white),
          ),
          Expanded(
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context),
              color: kcLightestGreyColor,
              child: Column(
                children: [
                  const ProfileSmallWidget(),
                  SizedBox(
                    height: screenHeight(context) * 0.02,
                  ),
                  Container(
                    width: screenWidth(context),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
