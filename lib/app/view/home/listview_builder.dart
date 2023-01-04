import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';

ListView makeListviewBuilder(ScrollController scrollController, int itemCount) {
  return ListView.builder(
    controller: scrollController,
    itemCount: itemCount,
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemBuilder: (context, index) {
      return Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: BoxText.headline('Satyjy gerek'),
            // isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceSmall,
                Text(
                  'Zaman market',
                  style: TextStyle(
                    color: kcHardGreyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    Text(
                      'Aşgabat, Taslama',
                      style: TextStyle(
                        color: kcHardGreyColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                      ),
                    ),
                    horizontalSpaceTiny,
                    SvgPicture.asset(Assets.dot),
                    horizontalSpaceTiny,
                    Text(
                      '3 km uzaklykda',
                      style: TextStyle(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            leading: Image.asset(Assets.avatarImage),
            trailing: Column(
              children: [
                Text(
                  '3 sagat öň',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: kcHardGreyColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 3,
            endIndent: 3,
            thickness: 1,
          ),
        ],
      );
    },
  );
}
