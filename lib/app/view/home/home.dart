import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/detail_info.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

import 'listview_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;
  MapController? mapController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    mapController = MapController();
    tabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Column(
            children: [
              TabBarWidget(
                tabController: tabController,
              ),
              //bu ugurda gozlan diyen yer
              // Container(
              //   width: 165.w,
              //   height: 25.h,
              //   margin: EdgeInsets.only(top: 5.h),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20.w),
              //     color: kcSecondaryTextColor,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SvgPicture.asset(Assets.refreshIcon),
              //       horizontalSpaceSmall,
              //       BoxText.headingThree(
              //         'Bu ugurda gözläň',
              //         color: kcPrimaryColor,
              //       )
              //     ],
              //   ),
              // ),
              Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 10.h).r,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    SizedBox(
                      width: screenWidth(context),
                      height: screenHeight(context),
                      // color: Colors.red,
                    ),
                    SizedBox(
                      width: screenWidth(context),
                      height: 400.h,
                      // color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.932,
              // snap: true,
              builder: (context, scrollController) {
                List<Widget> _sliverList(int size) {
                  final widgetList = <Widget>[
                    SliverAppBar(
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      pinned: true,
                      flexibleSpace: slidingPanelAppBar(),
                    ),
                    SliverFixedExtentList(
                      itemExtent: 100,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return itemWidget(context);
                        },
                        childCount: size,
                      ),
                    )
                  ];

                  return widgetList;
                }

                return CustomScrollView(
                  clipBehavior: Clip.antiAlias,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  controller: scrollController,
                  slivers: _sliverList(20),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => const DetailInfo(),
          ),
        );
      },
      child: Material(
        color: Colors.white,
        child: Column(
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
        ),
      ),
    );
  }

  Widget slidingPanelAppBar() {
    return Material(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //scroll line
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 13.h),
              width: 50.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: kcLightGreyColor,
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: SizedBox(
              height: 50.h,
              width: 370.w,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    width: 15.w,
                    height: 15.h,
                    margin: EdgeInsets.only(
                      right: 14.w,
                      left: 12.w,
                    ),
                    child: SvgPicture.asset(
                      Assets.searchNormalIcon,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                  hintText: 'Iň ýakyn işi tap',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10).w,
                    borderSide: const BorderSide(
                      color: kcPrimaryColor,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: kcPrimaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//38.1234, 58.0823
