import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum SelectedPlace {
  ashgabat,
  dashoguz,
  mary,
  lebap,
  balkan,
  ahal,
}

class ChoiceFilter {
  final String name;
  final bool? selected;
  ChoiceFilter(this.name, [this.selected = false]);

  ChoiceFilter copy({
    String? name,
    bool? selected,
  }) {
    return ChoiceFilter(name ?? this.name, selected ?? this.selected);
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isAnySelected = true;

  List<ChoiceFilter> choices = [
    ChoiceFilter('Soňky bildirişler öňde goý'),
    ChoiceFilter('Öňki bildirişleri öňde goý'),
    ChoiceFilter('Ýerleşýän ýeri boýunça tertiple'),
  ];
  List<ChoiceFilter> districts = [
    ChoiceFilter('Ashgabat'),
    ChoiceFilter('Ahal'),
    ChoiceFilter('Mary'),
    ChoiceFilter('Balkan'),
    ChoiceFilter('Lebap'),
    ChoiceFilter('Dashoguz')
  ];

  void _selectChoice(ChoiceFilter c) {
    final newList = List<ChoiceFilter>.from(choices);
    isAnySelected = false;

    for (var i = 0; i < newList.length; i++) {
      final item = newList[i];

      if (item.name == c.name && item.selected == true) {
        return;
      } else if (item.name == c.name && item.selected == false) {
        newList[i] = item.copy(selected: true);
        continue;
      }

      // unselect all others
      newList[i] = item.copy(selected: false);
    }

    // update state
    choices = newList;
    setState(() {});
  }

  void selectDistrict(ChoiceFilter c) {
    final newList = List<ChoiceFilter>.from(districts);

    for (var i = 0; i < newList.length; i++) {
      final item = newList[i];

      if (item.name == c.name && item.selected == true) {
        return;
      } else if (item.name == c.name && item.selected == false) {
        newList[i] = item.copy(selected: true);
        continue;
      }

      // unselect all others
      newList[i] = item.copy(selected: false);
    }

    // update state
    districts = newList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: REdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              Assets.backIcon,
            ),
          ),
        ),
        title: BoxText.headline(
          'Tertiple',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Column(
                children: choices.map((choice) {
                  return Row(
                    children: [
                      Checkbox(
                        activeColor: kcPrimaryColor,
                        side: BorderSide(width: 1.5, color: kcPrimaryColor),
                        value: choice.selected,
                        onChanged: (v) => _selectChoice(choice),
                      ),
                      // horizontalSpaceSmall,
                      Text(
                        choice.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14.sp),
                      ),
                    ],
                  );
                }).toList(),
              ),
              if (choices[2].selected == false)
                const SizedBox(
                  height: 60,
                )
              else
                const SizedBox(),
              Padding(
                padding: REdgeInsets.only(left: 50),
                child: Visibility(
                  visible: choices[2].selected == true,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: districts.map((e) {
                        return Row(
                          children: [
                            CustomRadioWidget<dynamic>(
                              isSelected: e.selected!,
                              onChanged: () => selectDistrict(e),
                            ),
                            horizontalSpaceSmall,
                            Text(e.name),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: REdgeInsets.all(8),
            child: BoxButton.block(
              title: 'Tertiple',
              disabled: isAnySelected,
              onTap: () {
                isAnySelected == false ? Navigator.pop(context) : null;
              },
            ),
          )
        ],
      ),
    );
  }
}
