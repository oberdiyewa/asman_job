import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bottom_navbar.dart';
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
                return Container(
                  padding: const EdgeInsets.only(left: 11),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoxText.headingOne('hi how are you'),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: BoxText.headingTwo('Index N-$index'),
                              // leading: ,
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
