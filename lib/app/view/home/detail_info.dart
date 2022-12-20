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
                  return Material(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.w)),
                    child: Padding(
                      padding: REdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceSmall,
                          verticalSpaceTiny,
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
                                    'Aşgabat, Taslama',
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
                                        '30 minut öň',
                                        style: TextStyle(
                                          color: kcHardGreyColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
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
                              Padding(
                                padding: REdgeInsets.only(left: 70),
                                child: SvgPicture.asset(Assets.favouriteIcon),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          Text(
                            'Ýerleşýän ýerimiz taslama. Zamana mini markeda ukyply satyjy gerek Ýerleşýän ýerimiz taslama. Zamana mini markeda ukyply satyjy gerek ',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          verticalSpaceSmall,
                          verticalSpaceTiny,
                          // ignore: lines_longer_than_80_chars

                          detailInfo('Ady', 'Zaman market'),
                          detailInfo('Wezipe', 'Satyjy'),
                          detailInfo('Ýaş', '25-30 ýaş'),
                          detailInfo('Aýlyk haky', '2500 TMT'),
                          detailInfo('Ýerleşýän ýeri', 'Aşgabat,Taslama'),
                          detailInfo('Iş wagty', 'Ýarym iş güni'),
                          detailInfo('Telefon belgisi', '+99365010101'),
                          verticalSpaceTiny,
                          Align(
                            alignment: Alignment.center,
                            child: BoxButton.medium(
                              onTap: () {
                                dialog(context,
                                    button1:
                                        const BoxButton.medium(title: 'OK'),
                                    contentText: Center(
                                      child: BoxText.headingThree(
                                        'Hormatly musderi, programma upjunciligmiz hic hilli jogapkarcilik cekmeyanligni size duyduryarys ',
                                        color: kcHardGreyColor,
                                      ),
                                    ));
                              },
                              title: 'Jan et',
                              leading: Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.callIcon,
                                    width: 16.w,
                                    height: 16.h,
                                  ),
                                  horizontalSpaceSmall,
                                ],
                              ),
                            ),
                          ),
                          verticalSpaceRegular,
                          BoxText.headline(
                            'Meňzeş işler',
                            color: kcHardGreyColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column detailInfo(String name, String value) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: kcHardGreyColor,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: kcPrimaryTextColor,
                ),
              )
            ],
          ),
        ),
        verticalSpaceSmall,
      ],
    );
  }
}
