import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublicEntityListItem extends StatelessWidget {
  const PublicEntityListItem({
    required this.publicEntity,
    required this.isVacancy,
    super.key,
  });
  final PublicEntity publicEntity;

  final bool isVacancy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MapService.instance.onMarkerTapped(
        context,
        entity: publicEntity,
        isVacancy: isVacancy,
      ),
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
