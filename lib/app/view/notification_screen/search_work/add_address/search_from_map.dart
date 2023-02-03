import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchLocationFromMap extends StatefulWidget {
  const SearchLocationFromMap({super.key});

  @override
  State<SearchLocationFromMap> createState() => _SearchLocationFromMapState();
}

class _SearchLocationFromMapState extends State<SearchLocationFromMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: REdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              Assets.backIcon,
            ),
          ),
        ),
        title: BoxText.headline(
          'Salgy goşmak',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: Stack(
        children: [
          Image.asset(
            Assets.mapImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 15,
            right: 1,
            child: CircleContainer(
              widget: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(Assets.gps),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 1,
            child: CircleContainer(
              widget: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(Assets.changeView),
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 55,
            left: 55,
            child: BoxButton.block(title: 'Tassykla'),
          ),
          Positioned(
              left: 10,
              top: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleContainer(
                    color: kcPrimaryColor,
                    widget: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(Assets.backIcon),
                    )),
              )),
        ],
      ),
    );
  }

  Container CircleContainer({
    required Widget widget,
    Color? color = Colors.white,
  }) {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: widget,
    );
  }
}
