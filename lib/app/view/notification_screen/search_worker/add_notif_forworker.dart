import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_address/add_address_worker.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_phone.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_profession.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChoiceWorkType {
  ChoiceWorkType(this.name, {this.selected = false});
  final String name;
  final bool? selected;

  ChoiceWorkType copy({
    String? name,
    bool? selected,
  }) {
    return ChoiceWorkType(
      name ?? this.name,
      selected: selected ?? this.selected,
    );
  }
}

class AddForWorkerNotif extends StatefulWidget {
  const AddForWorkerNotif({super.key});

  @override
  State<AddForWorkerNotif> createState() => _AddForWorkerNotifState();
}

class _AddForWorkerNotifState extends State<AddForWorkerNotif> {
  bool isChecked = false;
  bool isMounted = false;
  bool isExpand = false;
  bool isMountedforPhone = false;

  String selectedWorkType = 'Saýlaň (Doly iş güni, Ýarym iş güni we ş.m)';
  String finalResult = 'Wezipe gosh';
  String phoneNumber = 'Telefon belgi goş';
  bool _customTileExpanded = false;
  List<ChoiceWorkType> workTypes = [
    ChoiceWorkType('Doly iş güni'),
    ChoiceWorkType('Ýarym iş güni'),
    ChoiceWorkType('Möwsümleýin'),
    ChoiceWorkType('Meýletin'),
    ChoiceWorkType('Tejribe '),
    ChoiceWorkType('Taslama esasynda'),
    ChoiceWorkType('Uzakdan işlemek '),
  ];

  void _selectChoice(ChoiceWorkType c) {
    final newList = List<ChoiceWorkType>.from(workTypes);

    for (var i = 0; i < newList.length; i++) {
      final item = newList[i];

      if (item.name == c.name && item.selected!) {
        return;
      } else if (item.name == c.name && item.selected == false) {
        newList[i] = item.copy(selected: true);
        continue;
      }

      // unselect all others
      newList[i] = item.copy(selected: false);
    }
    selectedWorkType = c.name;
    // update state
    workTypes = newList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: REdgeInsets.all(20),
            child: SvgPicture.asset(
              Assets.backIcon,
            ),
          ),
        ),
        title: BoxText.headline(
          'Bildiriş ber',
          color: kcSecondaryTextColor,
        ),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      body: Stack(
        children: [
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionName(
                headlineWord: 'Bildiriş görnüşi',
              ),
              AddSection(
                widget: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      // margin: REdgeInsets.only(left: 23),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kcPrimaryColor,
                        // borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceTiny,
                    BoxText.body('Işgär gözleýän')
                  ],
                ),
              ),
              const SectionName(headlineWord: 'Ady'),
              AddSection(
                widget: BoxInputField(
                  controller: TextEditingController(),
                  placeholder: 'Ýazyň...',
                  borderColor: kcLightestGreyColor,
                ),
              ),
              const SectionName(
                headlineWord: 'Giňişleýin salgyňyz',
              ),
              AddSection(
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (context) => const AddAddressWorker(),
                          ),
                        );
                      },
                      child: const AddButton(),
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceSmall,
                    BoxText.headline(
                      'Salgy goş',
                      color: kcPrimaryColor,
                    )
                  ],
                ),
              ),
              const SectionName(headlineWord: 'Telefon belgi goş '),
              if (isMountedforPhone == false)
                AddSection(
                  widget: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getPhoneNumberAndReturnResult(context);
                        },
                        child: const AddButton(),
                      ),
                      horizontalSpaceSmall,
                      horizontalSpaceSmall,
                      BoxText.headline(
                        phoneNumber,
                        color: kcPrimaryColor,
                      )
                    ],
                  ),
                )
              else
                AddSection(
                  widget: Row(
                    children: [
                      const PhoneButton(),
                      horizontalSpaceSmall,
                      horizontalSpaceSmall,
                      BoxText.headline(
                        phoneNumber,
                        color: kcPrimaryColor,
                      )
                    ],
                  ),
                ),
              const SectionName(headlineWord: 'Wezipe'),
              if (isMounted == false)
                AddSection(
                  widget: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectProfessionAndReturnResult(context);
                        },
                        child: const AddButton(),
                      ),
                      horizontalSpaceSmall,
                      horizontalSpaceSmall,
                      BoxText.headline(
                        finalResult,
                        color: kcPrimaryColor,
                      )
                    ],
                  ),
                )
              else
                AddSection(
                  widget: Container(
                    width: 339.w,
                    height: 50.h,
                    margin: REdgeInsets.fromLTRB(1, 1, 1, 1),
                    padding: REdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 23,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kcLightestGreyColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoxText.body(finalResult),
                        GestureDetector(
                          onTap: () {
                            selectProfessionAndReturnResult(context);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: kcPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SectionName(
                headlineWord: 'Iş tertibi saýla',
              ),
              AddSection(
                hasChildren: true,
                widget: ExpansionTile(
                  onExpansionChanged: (bool isExapnd) {
                    setState(() {
                      isExpand = isExapnd;
                    });
                  },
                  title: isExpand
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoxText.headline(
                              'Birini saýlaň',
                              color: kcHardGreyColor,
                            ),
                            const Divider()
                          ],
                        )
                      : BoxText.headline(
                          selectedWorkType,
                          color: kcPrimaryColor,
                        ),
                  children: workTypes.map((choice) {
                    return Row(
                      children: [
                        Checkbox(
                          activeColor: kcPrimaryColor,
                          side: const BorderSide(
                            width: 1.5,
                            color: Color.fromRGBO(62, 82, 188, 0.25),
                          ),
                          value: choice.selected,
                          onChanged: (v) => _selectChoice(choice),
                        ),
                        // horizontalSpaceSmall,
                        Text(
                          choice.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SectionName(
                headlineWord: 'Ýaş derejesini saýla',
              ),
              AddSection(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomInputField(
                      controller: TextEditingController(),
                      borderColor: kcLightestGreyColor,
                    ),
                    BoxText.body('-dan'),
                    CustomInputField(
                      controller: TextEditingController(),
                      borderColor: kcLightestGreyColor,
                    ),
                    BoxText.body('-çenli'),
                  ],
                ),
              ),
              const SectionName(
                headlineWord: 'Aýlyk haky',
              ),
              AddSection(
                widget: BoxInputField(
                  controller: TextEditingController(),
                  placeholder: 'Ýazyň...',
                  borderColor: kcLightestGreyColor,
                ),
              ),
              const SectionName(
                headlineWord: 'Surat goş',
              ),
              AddSection(
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const AddButton(),
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceSmall,
                    BoxText.headline(
                      'Surat goşuň',
                      color: kcPrimaryColor,
                    )
                  ],
                ),
              ),
              const SectionName(
                headlineWord: 'Online wagty: ',
              ),
              const AddSection(
                customHeight: 100,
                widget: SliderWidget(),
              ),
              const SectionName(
                headlineWord: 'Bildiriş barada goşmaça maglumaty',
              ),
              const AddSection(
                customHeight: 120,
                widget: TextField(
                  maxLines: 8,
                  decoration: InputDecoration.collapsed(
                    hintText:
                        'Goşmaça bildirişleriňizi şu ýere ýazyp bilersiňiz',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kcHardGreyColor,
                    ),
                  ),
                ),
              ),
              const SectionName(
                headlineWord: ' ',
              ),
            ],
          ),
          Positioned(
            bottom: 1,
            child: AddSection(
              widget: BoxButton.block(
                title: 'Bildiriş goş',
                onTap: () {
                  dialog(
                    context,
                    button2: GestureDetector(
                      child: const BoxButton.small(title: 'Tassykla'),
                    ),
                    button1: const BoxButton.small(title: 'Goýbolsun'),
                    contentText: Column(
                      children: [
                        SvgPicture.asset(Assets.infoIcon),
                        verticalSpaceSmall,
                        BoxText.headline('Bildirişiňizi tassyklaň'),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> selectProfessionAndReturnResult(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(builder: (context) => const AddProfession()),
    );
    debugPrint(result.toString());
    if (mounted) {
      setState(() {
        isMounted = true;
        finalResult = result!;
      });
    }
  }

  Future<void> getPhoneNumberAndReturnResult(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(builder: (context) => const AddPhoneNumber()),
    );
    debugPrint(result);
    if (mounted) {
      setState(() {
        isMountedforPhone = true;
        phoneNumber = result!;
      });
    }
  }
}
