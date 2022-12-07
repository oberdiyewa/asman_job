import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

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
              MyTabBar(
                tabController: tabController,
              ),
              Container(
                width: 165,
                height: 25,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kcSecondaryTextColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(MyAsset.refreshIcon),
                    horizontalSpaceSmall,
                    BoxText.headingThree(
                      'Bu ugurda gözläň',
                      color: kcPrimaryColor,
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      width: screenWidth(context),
                      height: screenHeight(context),
                      // color: Colors.red,
                    ),
                    Container(
                      width: screenWidth(context),
                      height: 400,
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
              maxChildSize: 0.9,
              // snap: true,
              builder: (context, scrollController) {
                return Material(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Iň ýakyn işi tap',
                          hintStyle: TextStyle(
                            color: kcPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: BoxText.headline('Satyjy gerek'),
                                  // isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      verticalSpaceSmall,
                                      const Text(
                                        'Zaman market',
                                        style: TextStyle(
                                          color: kcHardGreyColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Row(
                                        children: const [
                                          Text(
                                            'Aşgabat, Taslama',
                                            style: TextStyle(
                                              color: kcHardGreyColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                            ),
                                          ),
                                          horizontalSpaceRegular,
                                          Text(
                                            '3 km uzaklykda',
                                            style: TextStyle(
                                              color: kcPrimaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  leading: Image.asset(MyAsset.avatarImage),
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
              },
            ),
          )
        ],
      ),
    );
  }
}

//38.1234, 58.0823
