import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/home/bloc/home_bloc.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/logic/bottom_navigation_provider.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublicEntityListItem extends StatelessWidget {
  const PublicEntityListItem({
    required this.publicEntity,
    required this.fromSearch,
    required this.isVacancy,
    super.key,
  });
  final PublicEntity publicEntity;
  final bool fromSearch;
  final bool isVacancy;

  void _onTapped(BuildContext ctx) {
    if (fromSearch) {
      ctx.read<BottomNavigationProvider>().changeScreen(EnumScreenName.home);
    }
    ctx.read<TabControllerCubit>().changeTab(
          EnumDraggableSheetState.detail,
          id: publicEntity.id,
          isVacancy: isVacancy,
        );
    if (isVacancy) {
      ctx
          .read<PublicVacancyDetailBloc>()
          .add(PublicVacancyDetailFetchEvent(publicEntity.id));
    } else {
      ctx
          .read<PublicProfileDetailBloc>()
          .add(PublicProfileDetailFetchEvent(publicEntity.id));
    }
    // MapService.singleton!.mapController!
    //     .animateCamera(
    //   super_app.CameraUpdate.newCameraPosition(
    //     super_app.CameraPosition(
    //       target: publicEntity.point,
    //       zoom: 15,
    //     ),
    //   ),
    // )
    //     .then((value) {
    //   MapService.singleton!.mapController!.showMarkerInfoWindow(
    //     super_app.MarkerId(
    //       publicEntity.id.toString(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapped(context),
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              // Title
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: BoxText.headline(publicEntity.title)),
                  SizedBox(
                    width: 80,
                    child: Text(
                      publicEntity.createdAt,
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall,
                  // Notification owner name
                  Text(
                    publicEntity.employerTitle ?? publicEntity.fullname ?? '',
                    style: TextStyle(
                      color: kcHardGreyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      // Region name
                      Text(
                        publicEntity.region,
                        style: TextStyle(
                          color: kcHardGreyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                      horizontalSpaceRegular,
                      // Distance
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
                                '${publicEntity.distance} uzaklykda',
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
              leading: SizedBox(
                height: 80.w,
                width: 80.w,
                child: CachedNetworkImage(
                  imageUrl: publicEntity.avatarUrl,
                  errorWidget: (context, url, error) => const Icon(Icons.image),
                ),
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
}
