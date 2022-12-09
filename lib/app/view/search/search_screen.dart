// ignore: eol_at_end_of_file
import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

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
          Column(
            children: [
              MyTabBar(
                tabController: tabController,
              ),
              Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 10.h).r,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Container(
                      width: screenWidth(context),
                      height: screenHeight(context),
                      // color: Colors.red,
                    ),
                    Container(
                      width: screenWidth(context),
                      height: 400.h,
                      // color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: REdgeInsets.only(
              top: 60,
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
          Container(
            width: screenWidth(context),
            height: 600.h,
            margin: const EdgeInsets.only(top: 110).w,
            child: ListView.builder(
              itemCount: 20,
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
            ),
          ),
        ],
      ),
    );
  }
}
