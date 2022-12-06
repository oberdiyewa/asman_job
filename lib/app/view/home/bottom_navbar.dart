import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: SizedBox(
          width: screenWidth(context),
          height: 50,
          child: BottomAppBar(
            color: Colors.white,
            // shape: const CircularNotchedRectangle(),
            // notchMargin: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    debugPrint('Home basyldy');
                  },
                  child: SvgPicture.asset(
                    MyAsset.homeIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                InkWell(
                  onTap: () {
                    debugPrint('Search basyldy');
                  },
                  child: SvgPicture.asset(
                    MyAsset.searchIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: SvgPicture.asset(
                    MyAsset.personIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(
                    MyAsset.giftIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
