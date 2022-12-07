import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/main_screen.dart';
import 'package:asman_work/app/view/home/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Stack(
          children: [
            FlutterMap(options: MapOptions()),
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
                    elevation: 10,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: kcSecondaryTextColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 11),
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
                    ),
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomBar(),
        floatingActionButton: customFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Container customFloatingActionButton() {
    return Container(
      width: 60,
      height: 60,
      // margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kcPrimaryColor,
          elevation: 8,
          child: const Icon(
            Icons.rectangle,
            color: kcSecondaryColor,
          ),
        ),
      ),
    );
  }
}
