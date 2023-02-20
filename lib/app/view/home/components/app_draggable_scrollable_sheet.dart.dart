import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/home/bloc/entity_detail_bloc/entity_detail_bloc.dart';
import 'package:asman_work/app/view/home/bloc/tab_controller_cubit/tab_controller_cubit.dart';
import 'package:asman_work/app/view/home/components/draggable_detail_screen.dart';
import 'package:asman_work/app/view/home/components/draggable_vacancy_list.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDraggableScrollableSheet extends StatelessWidget {
  const AppDraggableScrollableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TabControllerCubit, EnumDraggableSheetState>(
      builder: (context, tabState) {
        if (tabState == EnumDraggableSheetState.detail) {
          return const DraggableDetailScreen();
        } else {
          return DraggableVacancyList(
            tabState: tabState,
            screenHeight: screenHeight,
          );
        }
      },
    );
  }
}

class VacancyDetailInfo extends StatelessWidget {
  const VacancyDetailInfo(
    this.text, {
    required this.value,
    super.key,
  });
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: kcPrimaryTextColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: kcHardGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VacancyListItem extends StatelessWidget {
  const VacancyListItem({
    required this.vacancy,
    super.key,
  });
  final Vacancy vacancy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<TabControllerCubit>()
            .changeTab(EnumDraggableSheetState.detail);
        context
            .read<EntityDetailBloc>()
            .add(EntityDetailFetchEvent(vacancy.id));
        // MapService.singleton!.mapController!
        //     .animateCamera(
        //   CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //       target: vacancy.point,
        //       zoom: 15,
        //     ),
        //   ),
        // )
        //     .then((value) {
        //   MapService.singleton!.mapController!.showMarkerInfoWindow(
        //     MarkerId(
        //       vacancy.id.toString(),
        //     ),
        //   );
        // });
      },
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: BoxText.headline(vacancy.title)),
                  SizedBox(
                    width: 80,
                    child: Text(
                      vacancy.createdAt,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kcHardGreyColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
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
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              '•',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: kcHardGreyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            horizontalSpaceTiny,
                            Expanded(
                              child: Text(
                                '${vacancy.distance} uzaklykda',
                                style: TextStyle(
                                  color: kcPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              leading: Text('${vacancy.id}')
              // CachedNetworkImage(
              //   width: 60.w,
              //   height: 60.w,
              //   fit: BoxFit.cover,
              //   imageUrl: vacancy.avatarUrl,
              //   errorWidget: (context, url, dynamic error) {
              //     return const Icon(Icons.image_not_supported_rounded);
              //   },
              // ),
              // trailing: SizedBox(
              //   child: Column(
              //     children: [
              //       Text(
              //         vacancy.createdAt,
              //         style: TextStyle(
              //           fontSize: 12.sp,
              //           fontWeight: FontWeight.w400,
              //           color: kcHardGreyColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ,
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
}
