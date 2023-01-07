import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers.dart';
import 'app_draggable_scrollable_sheet.dart.dart';

class DraggableDetailScreen extends StatelessWidget {
  const DraggableDetailScreen({
    super.key, required this.scrollController
  });
   final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            color: const Color.fromRGBO(241, 241, 241, 1),
            padding: REdgeInsets.only(left: 13, top: 16, right: 14),
            child: ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        verticalSpaceTiny,
                        SvgPicture.asset(
                          Assets.detailImage,
                          width: 90.w,
                          height: 90.h,
                        ),
                      ],
                    ),
                    horizontalSpaceMedium,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Satyjy gerek',
                          style: TextStyle(
                            color: kcPrimaryTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                        Text(
                          '30 minut öň',
                          style: TextStyle(
                            color: kcHardGreyColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        verticalSpaceSmall,
                        Row(
                          children: [
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
                    Padding(
                      padding: REdgeInsets.only(left: 140),
                      // alignment: Alignment.,
                      child: SvgPicture.asset(Assets.favouriteIcon),
                    ),
                  ],
                ),
                verticalSpaceSmall, verticalSpaceTiny,
                const Divider(
                  thickness: 1,
                ),
                verticalSpaceSmall, verticalSpaceTiny,
                Text(
                  'Bellik',
                  style: TextStyle(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                verticalSpaceSmall, verticalSpaceTiny,
                Text(
                  'Ýerleşýän ýerimiz taslama. Zamana mini markeda ukyply satyjy gerek Ýerleşýän ýerimiz taslama. Zamana mini markeda ukyply satyjy gerek ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                verticalSpaceSmall,
                verticalSpaceTiny,
                const Divider(
                  thickness: 1,
                ),

                verticalSpaceSmall, verticalSpaceTiny,
                Text(
                  'Goşmaça maglumatlar',
                  style: TextStyle(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                verticalSpaceSmall, verticalSpaceTiny,

                // ignore: lines_longer_than_80_chars
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        VacancyDetailInfo(
                          'Wezipe',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          'Iş wagty ',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          'Aýlyk haky',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          'Ýaş',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          'Ýerleşýän ýeri',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          'Telefon belgisi',
                          isName: true,
                        ),
                        verticalSpaceTiny,
                      ],
                    ),
                    horizontalSpaceLarge,
                    horizontalSpaceLarge,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        VacancyDetailInfo(
                          'Satyjy',
                          isName: false,
                        ),
                        VacancyDetailInfo(
                          'Ýarym iş güni',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          '2500 aýlyk',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          '25-30 ýaş aralygy',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          'Aşgabat, Taslama',
                          isName: true,
                        ),
                        VacancyDetailInfo(
                          '+99365010101',
                          isName: true,
                        ),
                      ],
                    )
                  ],
                ),

                verticalSpaceSmall,
                const Divider(
                  thickness: 1,
                ),
                verticalSpaceSmall, verticalSpaceTiny,
                BoxText.headline(
                  'Meňzeş işler',
                  color: kcHardGreyColor,
                ),
                ...List.generate(
                  6,
                  (index) => Column(
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
                  ),
                )
                // makeListviewBuilder(scrollController, 6),
              ],
            ),
          ),
          Positioned(
            bottom: 3,
            left: 0,
            child: GestureDetector(
              onTap: () {
                dialog(
                  context,
                  button1: Column(
                    children: [
                      BoxButton.medium(
                        title: 'OK',
                        onTap: () {
                          debugPrint('basyldy');
                          launchUrl(
                            Uri(scheme: 'tel', path: '+99365010101'),
                          );
                        },
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                  contentText: Center(
                    child: Text(
                      'Hormatly musderi, programma upjunciligmiz hic hilli jogapkarcilik cekmeyanligni size duyduryarys ',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: kcHardGreyColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              child: Container(
                width: 390.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: kcPrimaryColor,
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.callIcon),
                    horizontalSpaceSmall,
                    horizontalSpaceTiny,
                    Text(
                      'Jan et',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
