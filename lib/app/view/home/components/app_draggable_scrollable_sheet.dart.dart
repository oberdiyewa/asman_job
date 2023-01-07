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

class AppDraggableScrollableSheet extends StatelessWidget {
  const AppDraggableScrollableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, EnumDraggableSheetState>(
      builder: (context, tabState) {
        if (tabState == EnumDraggableSheetState.detail) {
          return DraggableScrollableSheet(
            key: const Key('Detail'),
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return SizedBox.expand(
                child: Stack(
                  children: [
                    Container(
                      color: const Color.fromRGBO(241, 241, 241, 1),
                      padding: REdgeInsets.only(left: 13, top: 16, right: 14),
                      child: ListView(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Satyjy gerek',
                                    style: TextStyle(
                                      color: kcPrimaryTextColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    'Zaman market',
                                    style: TextStyle(
                                      color: kcHardGreyColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    '30 minut öň',
                                    style: TextStyle(
                                      color: kcHardGreyColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.dot),
                                      horizontalSpaceTiny,
                                      Text(
                                        '3 km uzaklykda',
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
                              Padding(
                                padding: REdgeInsets.only(left: 140),
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
                            'Ýerleşýän ýerimiz taslama. Zamana mini markeda ukyply satyjy gerek Ýerleşýän ýerimiz taslama. Zamana mini markeda ukyply satyjy gerek ',
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  detailInfoName('Wezipe'),
                                  detailInfoName('Iş wagty '),
                                  detailInfoName('Aýlyk haky'),
                                  detailInfoName('Ýaş '),
                                  detailInfoName('Ýerleşýän ýeri'),
                                  detailInfoName('Telefon belgisi'),
                                  verticalSpaceTiny,
                                ],
                              ),
                              horizontalSpaceLarge,
                              horizontalSpaceLarge,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  detailInfoValue('Satyjy'),
                                  detailInfoValue('Ýarym iş güni'),
                                  detailInfoValue('2500 aýlyk'),
                                  detailInfoValue('25-30 ýaş aralygy'),
                                  detailInfoValue('Aşgabat, Taslama'),
                                  detailInfoValue('+99365010101'),
                                ],
                              )
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
                          ...List.generate(
                            6,
                            (index) => Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: BoxText.headline('Satyjy gerek'),
                                  // isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      verticalSpaceSmall,
                                      Text(
                                        'Zaman market',
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
                                            'Aşgabat, Taslama',
                                            style: TextStyle(
                                              color: kcHardGreyColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          horizontalSpaceTiny,
                                          SvgPicture.asset(Assets.dot),
                                          horizontalSpaceTiny,
                                          Text(
                                            '3 km uzaklykda',
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
                                  leading: Image.asset(Assets.avatarImage),
                                  trailing: Column(
                                    children: [
                                      Text(
                                        '3 sagat öň',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: kcHardGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  indent: 3,
                                  endIndent: 3,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          )
                          // makeListviewBuilder(scrollController, 6),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          dialog(
                            context,
                            button1: Column(
                              children: const [
                                BoxButton.medium(title: 'OK'),
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
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return DraggableScrollableSheet(
            key: const Key('Vacancy list'),
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.932,
            // snap: true,
            builder: (context, scrollController) {
              List<Widget> _sliverList() {
                final widgetList = <Widget>[
                  SliverAppBar(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    pinned: true,
                    flexibleSpace: slidingPanelAppBar(context),
                  ),
                  if (tabState == EnumDraggableSheetState.lookingJob)
                    BlocBuilder<PublicVacancyBloc, PublicVacancyState>(
                      builder: (context, state) {
                        if (state is! PublicVacancyLoaded) {
                          return SliverFixedExtentList(
                            itemExtent: 200,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return const Material(
                                  color: Colors.white,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              childCount: 1,
                            ),
                          );
                        } else {
                          final vacancyList = state.vacancies;
                          return SliverFixedExtentList(
                            itemExtent: 100.h,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                final currVacancy = vacancyList[index];
                                return itemWidget(
                                  context,
                                  currVacancy,
                                );
                              },
                              childCount: vacancyList.length,
                            ),
                          );
                        }
                      },
                    ),
                  if (tabState == EnumDraggableSheetState.lookingWorker)
                    SliverFixedExtentList(
                      itemExtent: 100.h,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Material(
                            color: Colors.white,
                            child: ListTile(
                                onTap: () => context
                                    .read<TabControllerCubit>()
                                    .changeTab(EnumDraggableSheetState.detail),
                                title: const Text('Hello')),
                          );
                        },
                        childCount: 3,
                      ),
                    ),
                  if (tabState == EnumDraggableSheetState.detail)
                    SliverFixedExtentList(
                      itemExtent: screenWidth(context),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return const Material(
                            color: Colors.white,
                            child: ListTile(title: Text('Detail')),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                ];

                return widgetList;
              }

              return CustomScrollView(
                clipBehavior: Clip.antiAlias,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                controller: scrollController,
                slivers: _sliverList(),
              );
            },
          );
        }
      },
    );
  }

  Column detailInfoName(String name) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: kcHardGreyColor,
          ),
        ),
        verticalSpaceTiny,
      ],
    );
  }

  Column detailInfoValue(String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: kcPrimaryTextColor,
          ),
        ),
        verticalSpaceTiny,
      ],
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
      ],
    ),
  );
}
