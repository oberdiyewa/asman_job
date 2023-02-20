import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/bloc/entity_detail_bloc/entity_detail_bloc.dart';
import 'package:asman_work/app/view/home/bloc/public_vacancy_bloc/public_vacancy_bloc.dart';
import 'package:asman_work/app/view/home/components/app_draggable_scrollable_sheet.dart.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DraggableDetailScreen extends StatelessWidget {
  const DraggableDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        key: const Key('Detail'),
        initialChildSize: 0.4,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return SizedBox.expand(
            child: Stack(
              children: [
                Container(
                  color: const Color.fromRGBO(241, 241, 241, 1),
                  padding: REdgeInsets.only(left: 13, top: 16, right: 14),
                  child: BlocBuilder<EntityDetailBloc, EntityDetailState>(
                    builder: (context, state) {
                      if (state is EntityDetailFailure) {
                        return const Center(
                          child: Text('Something went wrong!'),
                        );
                      } else if (state is EntityDetailLoaded) {
                        final vDetail = state.entityDetail;
                        return ListView(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    verticalSpaceTiny,
                                    SvgPicture.asset(
                                      Assets.detailImage,
                                      width: 90.w,
                                      height: 90.h,
                                    ),
                                  ],
                                ),
                                horizontalSpaceMedium,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vDetail.title,
                                        style: TextStyle(
                                          color: kcPrimaryTextColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Text(
                                        vDetail.employerTitle,
                                        style: TextStyle(
                                          color: kcHardGreyColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Text(
                                        vDetail.createdAt,
                                        style: TextStyle(
                                          color: kcHardGreyColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                      Row(
                                        children: [
                                          // SvgPicture.asset(Assets.dot),
                                          Text(
                                            '•',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: kcHardGreyColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          horizontalSpaceTiny,
                                          Text(
                                            '${vDetail.distance} uzaklykda',
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
                                ),
                                Padding(
                                  padding: REdgeInsets.only(left: 40),
                                  // alignment: Alignment.,
                                  child: SvgPicture.asset(Assets.favouriteIcon),
                                ),
                              ],
                            ),
                            verticalSpaceSmall, verticalSpaceTiny,
                            const Divider(
                              thickness: 1,
                            ),
                            verticalSpaceSmall, verticalSpaceTiny,
                            Text(
                              'Bellik',
                              style: TextStyle(
                                color: kcPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
                            verticalSpaceSmall, verticalSpaceTiny,
                            Text(
                              vDetail.description,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            verticalSpaceSmall,
                            verticalSpaceTiny,
                            const Divider(
                              thickness: 1,
                            ),

                            verticalSpaceSmall, verticalSpaceTiny,
                            Text(
                              'Goşmaça maglumatlar',
                              style: TextStyle(
                                color: kcPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
                            verticalSpaceSmall, verticalSpaceTiny,

                            // ignore: lines_longer_than_80_chars
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Job title
                                VacancyDetailInfo(
                                  'Wezipe',
                                  value: vDetail.title,
                                ),
                                // Work time
                                VacancyDetailInfo(
                                  'Iş wagty',
                                  value: vDetail.employmentType ?? '',
                                ),
                                // Salary
                                VacancyDetailInfo(
                                  'Aýlyk haky',
                                  value:
                                      '${vDetail.salaryFrom} - ${vDetail.salaryTo} aralygy',
                                ),
                                // Age range
                                const VacancyDetailInfo(
                                  'Ýaş',
                                  value: '- ýaş aralygy',
                                ),
                                // Address
                                VacancyDetailInfo(
                                  'Ýerleşýän ýeri',
                                  value: vDetail.address,
                                ),
                                VacancyDetailInfo(
                                  'Telefon belgisi',
                                  value: vDetail.contactPhone.join(', '),
                                ),
                                verticalSpaceTiny,
                              ],
                            ),
                            verticalSpaceSmall,
                            const Divider(
                              thickness: 1,
                            ),
                            verticalSpaceSmall, verticalSpaceTiny,
                            BoxText.headline(
                              'Meňzeş işler',
                              color: kcHardGreyColor,
                            ),
                            verticalSpaceMedium,
                            BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
                              builder: (context, state) {
                                if (state is PublicVacancyLoaded) {
                                  final vacancyList = <Vacancy>[];
                                  for (var i = 0; i < 6; i++) {
                                    vacancyList.add(state.vacancies[i]);
                                  }
                                  return Column(
                                    children: vacancyList
                                        .map(
                                          (e) => VacancyListItem(vacancy: e),
                                        )
                                        .toList(),
                                  );
                                } else {
                                  return Row();
                                }
                              },
                            )
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                BlocBuilder<EntityDetailBloc, EntityDetailState>(
                  builder: (context, state) {
                    if (state is! EntityDetailLoaded) {
                      return const SizedBox.shrink();
                    } else {
                      final vDetail = state.entityDetail;
                      return Positioned(
                        bottom: 3,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            dialog(
                              context,
                              button1: Column(
                                children: [
                                  BoxButton.medium(
                                    title: 'OK',
                                    onTap: () async {
                                      debugPrint('basyldy');
                                      final url = Uri(
                                        scheme: 'tel',
                                        path: vDetail.contactPhone.first,
                                      );
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    },
                                  ),
                                  verticalSpaceSmall,
                                ],
                              ),
                              contentText: Center(
                                child: Text(
                                  'Hormatly musderi, programma upjunciligmiz hic hilli jogapkarcilik cekmeyanligni size duyduryarys ',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kcHardGreyColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 390.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                              color: kcPrimaryColor,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Assets.callIcon),
                                  horizontalSpaceSmall,
                                  horizontalSpaceTiny,
                                  Text(
                                    'Jan et',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          );
        },);
  }
}
