import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/bloc/public_vacancy_bloc/public_vacancy_bloc.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/home/components/filter_screen.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'draggable_detail_screen.dart';
import 'draggable_vacancy_list.dart';

class AppDraggableScrollableSheet extends StatelessWidget {
  const AppDraggableScrollableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, EnumDraggableSheetState>(
      builder: (context, tabState) {
        if (tabState == EnumDraggableSheetState.detail) {
          return DraggableScrollableSheet(
            key: const Key('Detail'),
            initialChildSize: 0.63,
            minChildSize: 0.4,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return DraggableDetailScreen(
                scrollController: scrollController,
              );
            },
          );
        } else {
          return DraggableVacancyList(tabState: tabState);
        }
      },
    );
  }
}

Widget itemWidget(BuildContext context, Vacancy vacancy) {
  return GestureDetector(
    onTap: () {
      context
          .read<TabControllerCubit>()
          .changeTab(EnumDraggableSheetState.detail);
      // Navigator.push<dynamic>(
      //   context,
      //   MaterialPageRoute<dynamic>(
      //     builder: (context) => const DetailInfo(),
      //   ),
      // );
    },
    child: Material(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: BoxText.headline(vacancy.title),
            // isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceSmall,
                Text(
                  vacancy.employerTitle,
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
                      vacancy.region,
                      style: TextStyle(
                        color: kcHardGreyColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                      ),
                    ),
                    horizontalSpaceRegular,
                    Text(
                      vacancy.distance,
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
            leading: CachedNetworkImage(
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              imageUrl: vacancy.avatarUrl,
              errorWidget: (context, url, dynamic error) {
                return const Icon(Icons.image_not_supported_rounded);
              },
            ),
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

Widget slidingPanelAppBar(BuildContext context) {
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
                suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: ((context) => FilterScreen())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: SvgPicture.asset(Assets.filter),
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
        BoxButton.small(title: 'title')
      ],
    ),
  );
}

class VacancyDetailInfo extends StatelessWidget {
  const VacancyDetailInfo(
    this.text, {
    super.key,
    required this.isName,
  });
  final String text;
  final bool isName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: isName ? FontWeight.w600 : FontWeight.w400,
            color: isName ? kcPrimaryTextColor : kcHardGreyColor,
          ),
        ),
        verticalSpaceTiny,
      ],
    );
    
  }
}
