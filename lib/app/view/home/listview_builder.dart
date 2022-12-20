import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers.dart';

ListView makeListviewBuilder(ScrollController scrollController, int itemCount) {
  return ListView.builder(
    controller: scrollController,
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return Column(
        children: [
          ListTile(
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
                    horizontalSpaceRegular,
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
          ),
          const Divider(
            indent: 3,
            endIndent: 3,
            thickness: 2,
          ),
        ],
      );
    },
  );
}
