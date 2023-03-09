import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isAnySelected = true;
  List<String> province = [
    'Aşgabat şäheri',
    'Ahal welaýaty',
    'Mary welaýaty',
    'Lebap welaýaty',
    'Daşoguz welaýaty',
    'Balkan welaýaty'
  ];

  List<List<String>> districts = [
    [
      'Ählisini saýla',
      'Parahat 1',
      'Parahat 2',
      'Parahat 3',
      'Parahat 4',
      'Parahat 5',
      'Parahat 6',
      'Parahat 7',
      'Parahat 8',
      'Arzuw',
      'Bitaraplyk şaýoly',
      'Bagyr',
      'Taslama',
      'Gurtly',
      'Köşi',
    ],
    [
      'Ählisini saýla',
      'Anew',
      'Yashlyk',
      'Kaka',
    ],
    ['Ählisini saýla', 'Mary shaheri', 'Bayramaly', 'Turkmengala'],
    ['Ählisini saýla', 'Turkmenabat shaheri', 'Sayat', 'Halac', 'Koytendag'],
    [
      'Ählisini saýla',
      'Dashoguz shaheri',
      'Koneurgenc',
      'Boldumsaz',
      'Gubadag',
    ],
    [
      'Ählisini saýla',
      'Turkmenbashy',
      'Serdar',
      'Nebitdag',
    ]
  ];
  List<String> workTypes = [
    'Ählisini saýla',
    'Doly iş güni',
    'Ýarym iş güni',
    'Möwsümleýin iş',
    'Meýletin iş',
    'Tejribe iş',
    'Taslama esasynda iş',
    'Uzakdan iş'
  ];
  List<int> currentList = [];
  List<int> workTypeList = [];

  String title = '';
  bool isProvinceSelected = false;
  int? currentIndex;

  String selectedPlace = '';
  String selectedWorkType = '';
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    currentIndex != null ? selectedPlace = province[currentIndex!] : null;
    workTypeList.isNotEmpty
        ? selectedWorkType = workTypes[workTypeList[0]]
        : null;
    print(currentIndex);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppbar(title: 'Tertiple'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              InkWell(
                splashColor: kcPrimaryColor.withOpacity(0.25),
                onTap: () {
                  bottomSheetWidgetPlaces(context);
                },
                child: filterSections('Ýerleşýän ýeri', selectedPlace),
              ),
              InkWell(
                splashColor: kcPrimaryColor.withOpacity(0.25),
                onTap: () {
                  bottomSheetWorkTypes(context);
                },
                child: filterSections('Iş wagty', selectedWorkType),
              ),
              InkWell(
                  splashColor: kcPrimaryColor.withOpacity(0.25),
                  onTap: () {
                    bottomSheetWorkTypes(context);
                  },
                  child: filterSections('Bildirişiň goýulan wagty', ''))
            ],
          ),
          Padding(
            padding: REdgeInsets.all(20),
            child: BoxButton.block(
              title: 'Tertiple',
              style: headlineStyle,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> bottomSheetWidgetPlaces(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 437.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bottomModalHeader(context,
                      isProvinceSelected: isProvinceSelected),
                  if (isProvinceSelected)
                    bottomModalDistricts(setState, currentIndex: currentIndex!)
                  else
                    bottomModalProvinces(setState)
                ],
              ),
            );
          },
        );
      },
    );
  }

  Container bottomModalDistricts(
    StateSetter setState, {
    required int currentIndex,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 23, right: 16, top: 10),
      height: 370.h,
      child: ListView.builder(
          itemCount: districts[currentIndex].length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    currentList.contains(index)
                        ? currentList.remove(index)
                        : currentList.add(index);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoxText.body(
                          districts[currentIndex][index],
                          color: currentList.contains(index) ||
                                  (currentList.contains(0))
                              ? kcPrimaryColor
                              : kcPrimaryTextColor,
                        ),
                        if (currentList.contains(index) ||
                            (currentList.contains(0)))
                          const Icon(
                            Icons.done,
                            color: kcPrimaryColor,
                            size: 15,
                          )
                        else
                          const SizedBox()
                      ],
                    ),
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }

  Container bottomModalProvinces(StateSetter setState) {
    return Container(
      padding: const EdgeInsets.only(left: 23, right: 16, top: 10),
      height: 370.h,
      child: ListView.builder(
          itemCount: province.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    title = province[index];
                    currentIndex = index;
                    isProvinceSelected = true;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxText.body(province[index]),
                      SvgPicture.asset(
                        Assets.arrowForwardGrey,
                      ),
                    ],
                  ),
                ),
                verticalSpaceTiny,
                Divider()
              ],
            );
          }),
    );
  }

  Container bottomModalHeader(
    BuildContext context, {
    required bool isProvinceSelected,
  }) {
    return Container(
      height: 50.h,
      // padding: REdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: kcPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 15, top: 10, bottom: 10),
                    child: SvgPicture.asset(Assets.backIcon),
                  ),
                ),
              ),
              horizontalSpaceSmall,
              BoxText.headline(
                title,
                color: kcSecondaryTextColor,
              )
            ],
          ),
          if (isProvinceSelected)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ColoredBox(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 10, top: 10, bottom: 10),
                  child: BoxText.headline(
                    'Saýlaň',
                    color: kcSecondaryTextColor,
                  ),
                ),
              ),
            )
          else
            const SizedBox()
        ],
      ),
    );
  }

  Future<void> bottomSheetWorkTypes(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 437.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h,
                    // padding: REdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ColoredBox(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 15, top: 10, bottom: 10),
                                  child: SvgPicture.asset(Assets.backIcon),
                                ),
                              ),
                            ),
                            horizontalSpaceSmall,
                            BoxText.headline(
                              title,
                              color: kcSecondaryTextColor,
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: ColoredBox(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 10, top: 10, bottom: 10),
                              child: BoxText.headline(
                                'Saýlaň',
                                color: kcSecondaryTextColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 23, right: 16, top: 10),
                    height: 370.h,
                    child: ListView.builder(
                      itemCount: workTypes.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                workTypeList.contains(index)
                                    ? workTypeList.remove(index)
                                    : workTypeList.add(index);
                                setState(() {});
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BoxText.body(
                                    workTypes[index],
                                    color: workTypeList.contains(index) ||
                                            (workTypeList.contains(0))
                                        ? kcPrimaryColor
                                        : kcPrimaryTextColor,
                                  ),
                                  if (workTypeList.contains(index) ||
                                      (workTypeList.contains(0)))
                                    const Icon(
                                      Icons.done,
                                      color: kcPrimaryColor,
                                      size: 15,
                                    )
                                  else
                                    const SizedBox()
                                ],
                              ),
                            ),
                            verticalSpaceTiny,
                            Divider()
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget filterSections(String title, String selectedItem) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.only(left: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxText.body(title),
                BoxText.body(
                  selectedItem,
                  color: kcLightGreyColor,
                )
              ],
            ),
          ),
          const Divider(
            endIndent: 20,
          )
        ],
      ),
    );
  }
}
