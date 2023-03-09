import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification/section_add.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../notification/add_address/search_from_map.dart';

class AddAddressWorker extends StatefulWidget {
  const AddAddressWorker({super.key});

  @override
  State<AddAddressWorker> createState() => _AddAddressWorkerState();
}

class _AddAddressWorkerState extends State<AddAddressWorker> {
  @override
  Widget build(BuildContext context) {
    var _textController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: const BaseAppbar(title: 'Salgy goşmak'),
      body: AddSection(
        customHeight: 160,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(
                  // top: 10,
                  // left: 10,
                  // right: 10,
                  ),
              child: SizedBox(
                height: 50.h,
                width: 380.w,
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      width: 17.w,
                      height: 17.h,
                      margin: EdgeInsets.only(
                        right: 14.w,
                        left: 12.w,
                      ),
                      child: SvgPicture.asset(
                        Assets.searchNormalIcon,
                      ),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10).w,
                    // ),
                    hintText: 'Salgy gözle',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(17),
                      child: SvgPicture.asset(Assets.clear),
                    ),
                    hintStyle: TextStyle(
                      color: kcHardGreyColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const SearchLocationFromMap(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.map),
                    horizontalSpaceMedium,
                    const Text(
                      'Kartada saýla',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 16),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.gps),
                  horizontalSpaceMedium,
                  const Text(
                    'Meniň ýerleşýän ýerim',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
