import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/home/components/filter_screen.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SlidingPanelAppBar extends StatelessWidget {
  const SlidingPanelAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  context
                      .read<BottomNavigationProvider>()
                      .changeScreen(EnumScreenName.search);
                },
                enableInteractiveSelection: false,
                focusNode: AlwaysDisableFocusNode(),
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const FilterScreen(),
                        ),
                      );
                    },
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(Assets.filter),
                      ),
                    ),
                  ),
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

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
