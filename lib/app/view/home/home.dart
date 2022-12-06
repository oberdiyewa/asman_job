import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asmanshop/app/view/helpers.dart';
import 'package:asmanshop/app/view/home/search_work_tab.dart';
import 'package:asmanshop/app/view/home/search_worker_tab.dart';
import 'package:asmanshop/app/view/home/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: myBottomNavigationBar(context),
        floatingActionButton: myFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: [
            Image.asset(MyAsset.mapImage),
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
                    // elevation: 0,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: kcSecondaryTextColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextField(
                            decoration: InputDecoration(),
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
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container myFloatingActionButton() {
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
