import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../home/components/filter_screen.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool isAnySelected = true;

  List<ChoiceFilter> languages = [
    ChoiceFilter('Türkmençe'),
    ChoiceFilter('Русский '),
    ChoiceFilter('English'),
  ];

  void _selectLanguage(ChoiceFilter c) {
    final newList = List<ChoiceFilter>.from(languages);

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
    languages = newList;
    setState(() {});
  }

  @override
  void initState() {
    _selectLanguage(languages.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: const BaseAppbar(title: 'Dil saýla'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddSection(
            customHeight: 170,
            widget: SizedBox.expand(
              child: Column(
                children: [
                  Column(
                    children: languages.map((e) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              CustomRadioWidget<dynamic>(
                                isSelected: e.selected!,
                                onChanged: () => _selectLanguage(e),
                              ),
                              horizontalSpaceSmall,
                              BoxText.body(e.name),
                            ],
                          ),
                          verticalSpaceRegular
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: BoxButton.block(
              title: 'Tassykla',
              disabled: !isAnySelected,
              style: heading2Style.copyWith(fontSize: 16),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
