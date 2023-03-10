import 'dart:async';

import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/screens/home/bloc/home_bloc.dart';
import 'package:asman_work/app/view/screens/home/components/draggable_scrollable_sheet/public_entity_list_item.dart';
import 'package:asman_work/app/view/screens/home/components/map_widget.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/notification/notif_widgets.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:asman_work/components/ui/refresh_button.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

ValueNotifier<String> _appBarText = ValueNotifier('');

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required this.publicEntity,
    required this.isVacancy,
    super.key,
  });

  final PublicEntity publicEntity;
  final bool isVacancy;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _appBarTitle = '';

  void toogleAppBarTitile(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 200), () {
      MapService.instance.moveDelegate!(widget.publicEntity.point, 13);
    });
    final catalogueBlocState = context.read<UserCatalogueBloc>().state;
    if (catalogueBlocState is! UserCatalogueLoaded) {
      context.read<UserCatalogueBloc>().add(UserCatalogueFetchEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobBaseAppbar(
        title: _appBarTitle,
        onBack: () => Navigator.pop(context),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const MapWidget(
              forChoosingAddress: false,
            ),
          ),
          DraggableEntityDetail(
            id: widget.publicEntity.id,
            isVacancy: widget.isVacancy,
            callBack: toogleAppBarTitile,
          )
        ],
      ),
    );
  }
}

class DraggableEntityDetail extends StatelessWidget {
  const DraggableEntityDetail({
    required this.id,
    required this.isVacancy,
    required this.callBack,
    super.key,
  });

  final int id;
  final bool isVacancy;
  final ValueChanged<String> callBack;

  @override
  Widget build(BuildContext context) {
    print('set State called');
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 1) {
          callBack(_appBarText.value);
        } else {
          callBack('');
        }
        return true;
      },
      child: DraggableScrollableSheet(
        key: const Key('Detail'),
        initialChildSize: 0.4,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return Stack(
            children: [
              Container(
                color: Colors.white,
                padding: REdgeInsets.only(
                  left: 13,
                  top: 16,
                  right: 14,
                  bottom: 25,
                ),
                child: isVacancy
                    ? BlocConsumer<PublicVacancyDetailBloc,
                        PublicVacancyDetailState>(
                        listener: (ctx, state) {
                          if (state is PublicVacancyDetailFailure) {
                            showErrorDialog(ctx, state.errorMessage);
                          }
                        },
                        builder: (context, state) {
                          if (state is PublicVacancyDetailFailure) {
                            return JobRefreshButton(
                              onTap: () {
                                context
                                    .read<PublicVacancyDetailBloc>()
                                    .add(PublicVacancyDetailFetchEvent(id));
                              },
                            );
                          } else if (state is PublicVacancyDetailLoaded) {
                            final vDetail = state.publicVacancyDetail;
                            _appBarText.value = vDetail.title;
                            return EntityDetailListView(
                              vDetail: vDetail,
                              pDetail: null,
                              isVacancy: isVacancy,
                              scrollController: scrollController,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    : BlocConsumer<PublicProfileDetailBloc,
                        PublicProfileDetailState>(
                        listener: (ctx, state) {
                          if (state is PublicProfileDetailFailure) {
                            showErrorDialog(ctx, state.errorMessage);
                          }
                        },
                        builder: (context, state) {
                          if (state is PublicProfileDetailFailure) {
                            return JobRefreshButton(
                              onTap: () {
                                print(id);
                                context
                                    .read<PublicProfileDetailBloc>()
                                    .add(PublicProfileDetailFetchEvent(id));
                              },
                            );
                          } else if (state is PublicProfileDetailLoaded) {
                            final pDetail = state.publicProfileDetail;
                            _appBarText.value = pDetail.title;
                            return EntityDetailListView(
                              pDetail: pDetail,
                              vDetail: null,
                              isVacancy: isVacancy,
                              scrollController: scrollController,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
              ),

              // Call to advertiser button

              if (isVacancy)
                BlocBuilder<PublicVacancyDetailBloc, PublicVacancyDetailState>(
                  builder: (context, state) {
                    if (state is! PublicVacancyDetailLoaded) {
                      return const SizedBox.shrink();
                    } else {
                      final vDetail = state.publicVacancyDetail;
                      return CallerButton(phone: vDetail.contactPhone.first);
                    }
                  },
                )
              else
                BlocBuilder<PublicProfileDetailBloc, PublicProfileDetailState>(
                  builder: (context, state) {
                    if (state is! PublicProfileDetailLoaded) {
                      return const SizedBox.shrink();
                    } else {
                      final pDetail = state.publicProfileDetail;
                      return CallerButton(phone: pDetail.phone);
                    }
                  },
                )
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> showErrorDialog(BuildContext context, String errorMessage) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class EntityDetailListView extends StatelessWidget {
  const EntityDetailListView({
    required this.vDetail,
    required this.isVacancy,
    required this.scrollController,
    required this.pDetail,
    super.key,
  });

  final PublicVacancyDetail? vDetail;
  final Profile? pDetail;
  final bool isVacancy;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: scrollController,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            if (isVacancy)
              CachedNetworkImage(
                imageUrl: vDetail!.avatarUrl,
                height: 80,
                width: 80,
              )
            else
              BlocBuilder<UserCatalogueBloc, UserCatalogueState>(
                builder: (context, state) {
                  final profileAvatarList = (state as UserCatalogueLoaded)
                      .userCatalogue
                      .profileAvatars;
                  final profileAvatar = profileAvatarList!
                      .where((e) => e.number == pDetail!.avatarNumber)
                      .toList();
                  return CachedNetworkImage(
                    imageUrl: profileAvatar[0].avatarUrl,
                    height: 80,
                    width: 80,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image),
                  );
                },
              ),
            horizontalSpaceMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isVacancy ? vDetail!.title : pDetail!.title,
                    style: TextStyle(
                      color: kcPrimaryTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    isVacancy ? vDetail?.employerTitle ?? '' : pDetail!.name,
                    style: TextStyle(
                      color: kcHardGreyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    isVacancy ? vDetail!.createdAt : pDetail!.createdAt,
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
                        isVacancy
                            ? '${vDetail!.distance} uzaklykda'
                            : 'pDetail.distance',
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
          isVacancy ? vDetail!.description : pDetail!.aboutMe ?? '',
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
              value: isVacancy ? vDetail!.title : pDetail!.title,
            ),
            // Work time
            VacancyDetailInfo(
              'Iş wagty',
              value: isVacancy
                  ? vDetail?.employmentType ?? ''
                  : 'pDetail.employmentType',
            ),
            // Salary
            VacancyDetailInfo(
              'Aýlyk haky',
              value: isVacancy
                  ? '${vDetail?.salaryFrom ?? ''} - ${vDetail?.salaryTo ?? ''} aralygy'
                  : 'pDetail.salaryFrom',
            ),
            // Age range
            const VacancyDetailInfo(
              'Ýaş',
              value: '- ýaş aralygy',
            ),
            // Address
            VacancyDetailInfo(
              'Ýerleşýän ýeri',
              value: isVacancy ? vDetail!.address : pDetail!.address!.address,
            ),
            VacancyDetailInfo(
              'Telefon belgisi',
              value:
                  isVacancy ? vDetail!.contactPhone.join(', ') : pDetail!.phone,
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

        // Similar advertisements

        if (isVacancy)
          BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
            builder: (context, state) {
              if (state is PublicVacancyLoaded) {
                final vacancyList = <PublicEntity>[];
                for (var i = 0; i < 6; i++) {
                  vacancyList.add(state.vacancies[i]);
                }
                return Column(
                  children: vacancyList
                      .map(
                        (e) => PublicEntityListItem(
                          publicEntity: e,
                          isVacancy: isVacancy,
                        ),
                      )
                      .toList(),
                );
              } else {
                return Row();
              }
            },
          )
        else
          BlocBuilder<PublicProfileBloc, PublicProfileState>(
            builder: (context, state) {
              if (state is PublicProfileLoaded) {
                final profileList = <PublicEntity>[];
                for (var i = 0; i < 6; i++) {
                  profileList.add(state.profiles[i]);
                }
                return Column(
                  children: profileList
                      .map(
                        (e) => PublicEntityListItem(
                          publicEntity: e,
                          isVacancy: isVacancy,
                        ),
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
  }
}

class CallerButton extends StatelessWidget {
  const CallerButton({
    required this.phone,
    super.key,
  });

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      // bottom: 3,
      child: GestureDetector(
        onTap: () {
          showDialog<dynamic>(
            context: context,
            builder: (ctx) => JobAlertDialog(
              button1: Column(
                children: [
                  BoxButton.medium(
                    title: 'OK',
                    onTap: () async {
                      Navigator.pop(ctx);
                      if (kReleaseMode) {
                        final url = Uri(
                          scheme: 'tel',
                          path: phone,
                        );
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      } else {
                        debugPrint(phone);
                      }
                    },
                  ),
                  verticalSpaceSmall,
                ],
              ),
              contentText: Center(
                child: Text(
                  'Hormatly musderi, programma upjunciligmiz hic hili jogapkarcilik cekmeyanligini size duyduryarys ',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: kcHardGreyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
        child: Container(
          // width: 390.w,
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 46.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kcPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
