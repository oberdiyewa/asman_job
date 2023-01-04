import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  MapController? mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Stack(
          children: [
            FlutterMap(
              layers: [
                TileLayerOptions(
                  urlTemplate: 'https://geo.asmantiz.com/tile/{z}/{x}/{y}.png',
                )
              ],
              mapController: mapController,
              options: MapOptions(
                center: LatLng(38.1234, 58.0823),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: kcPrimaryColor,
                  radius: 20.r,
                  child: SvgPicture.asset(Assets.backIcon),
                ),
              ),
            ),
            Positioned.fill(
              child: DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.5,
                maxChildSize: 1,
                // snap: true,
                builder: (context, scrollController) {
                  return Container(
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
                              children: [
                                detailInfoName('Wezipe'),
                                detailInfoName('Iş wagty '),
                                detailInfoName('Aýlyk haky'),
                                detailInfoName('Ýaş '),
                                detailInfoName('Ýerleşýän ýeri'),
                                detailInfoName('Telefon belgisi'),
                                verticalSpaceTiny,
                              ],
                            ),
                            horizontalSpaceLarge,
                            horizontalSpaceLarge,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                detailInfoValue('Satyjy'),
                                detailInfoValue('Ýarym iş güni'),
                                detailInfoValue('2500 aýlyk'),
                                detailInfoValue('25-30 ýaş aralygy'),
                                detailInfoValue('Aşgabat, Taslama'),
                                detailInfoValue('+99365010101'),
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
                  );
                },
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
                      children: const [
                        BoxButton.medium(title: 'OK'),
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
      ),
    );
  }

  Column detailInfoName(String name) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: kcHardGreyColor,
          ),
        ),
        verticalSpaceTiny,
      ],
    );
  }

  Column detailInfoValue(String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: kcPrimaryTextColor,
          ),
        ),
        verticalSpaceTiny,
      ],
    );
  }
}


/*
dialog(context,
                                    button1:
                                        const BoxButton.medium(title: 'OK'),
                                    contentText: Center(
                                      child: BoxText.headingThree(
                                        'Hormatly musderi, programma upjunciligmiz hic hilli jogapkarcilik cekmeyanligni size duyduryarys ',
                                        color: kcHardGreyColor,
                                      ),
                                    ));

*/