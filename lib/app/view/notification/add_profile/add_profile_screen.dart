import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification/add_address/add_address_screen.dart';
import 'package:asman_work/app/view/notification/add_phone.dart';
import 'package:asman_work/app/view/notification/add_profession.dart';
import 'package:asman_work/app/view/notification/add_vacancy/add_vacancy_screen.dart';
import 'package:asman_work/app/view/notification/bloc/user_catalogue_bloc/user_catalogue_bloc.dart';
import 'package:asman_work/app/view/notification/notif_widgets.dart';
import 'package:asman_work/app/view/notification/section_add.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  bool isChecked = false;

  String address = '';
  String phone = '';
  String profession = '';
  String emtType = '';
  String image = '';
  double activeDays = 1;

  void setValue(String value, EnumProfileAddSections section) {
    switch (section) {
      case EnumProfileAddSections.address:
        address = value;
        break;
      case EnumProfileAddSections.phone:
        phone = value;
        break;
      case EnumProfileAddSections.position:
        profession = value;
        break;
      case EnumProfileAddSections.employmentType:
        emtType = value;
        break;
      case EnumProfileAddSections.image:
      // ignore: no_default_cases
      default:
        image = value;
    }
  }

  late final TextEditingController nameController;
  late final TextEditingController salaryFromController;
  late final TextEditingController salaryToController;
  late final TextEditingController descriptionController;

  List<String> sectionNameList = [];

  @override
  void initState() {
    nameController = TextEditingController();
    salaryFromController = TextEditingController();
    salaryToController = TextEditingController();
    descriptionController = TextEditingController();
    sectionNameList = [
      'Bildiriş görnüşi',
      'Ady',
      'Giňişleýin salgyňyz',
      'Telefon belgi goş ',
      'Wezipän ady',
      'Iş tertibi saýla',
      'Aýlyk haky',
      'Surat goş',
      'Online wagty:',
      'Bildiriş barada goşmaça maglumaty'
    ];
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    salaryFromController.dispose();
    salaryToController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: const JobBaseAppbar(title: 'Bildiriş ber'),
      body: BlocBuilder<UserCatalogueBloc, UserCatalogueState>(
        builder: (context, state) {
          return Stack(
            children: [
              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    EnumProfileAddSections.values.length,
                    (index) => AddProfileSection(
                      catalogueState: state,
                      section: EnumProfileAddSections.values[index],
                      sectionName: sectionNameList[index],
                      nameController: nameController,
                      salaryFromController: salaryFromController,
                      salaryToController: salaryToController,
                      descriptionController: descriptionController,
                      valueChanged: setValue,
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
                      print(addressValue.value);
                      print(nameController.text);
                      print(phone);
                      print(profession);
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
          );
        },
      ),
    );
  }
}

class AddProfileSection extends StatefulWidget {
  const AddProfileSection({
    required this.section,
    required this.sectionName,
    required this.catalogueState,
    required this.nameController,
    required this.salaryFromController,
    required this.salaryToController,
    required this.descriptionController,
    required this.valueChanged,
    super.key,
  });

  final EnumProfileAddSections section;
  final String sectionName;
  final UserCatalogueState catalogueState;

  final TextEditingController nameController;
  final TextEditingController salaryFromController;
  final TextEditingController salaryToController;
  final TextEditingController descriptionController;

  final ValueEntered<String> valueChanged;

  @override
  State<AddProfileSection> createState() => _AddProfileSectionState();
}

class _AddProfileSectionState extends State<AddProfileSection> {
  bool isExpand = false;

  String selectedWorkType = 'Saýlaň (Doly iş güni, Ýarym iş güni we ş.m)';

  String enteredValue = '';

  void _onValueChanged(String value) {
    setState(() {
      enteredValue = value;
    });
    widget.valueChanged(enteredValue, widget.section);
  }

  List<ChoiceWorkType> workTypes = [];

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
  void initState() {
    if (widget.catalogueState is UserCatalogueLoaded) {
      final employmentTypeList =
          (widget.catalogueState as UserCatalogueLoaded).employmentTypes;
      workTypes = employmentTypeList
          .map<ChoiceWorkType>((e) => ChoiceWorkType(e.title))
          .toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionName(
            headlineWord: widget.sectionName,
          ),
          sectionwidget(widget.section),
        ],
      ),
    );
  }

  Widget sectionwidget(EnumProfileAddSections section) {
    switch (section) {
      case EnumProfileAddSections.adsType:
        return AddSection(
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
              BoxText.body('Iş gözleýän')
            ],
          ),
        );
      case EnumProfileAddSections.address:
        return AddSection(
          widget: ValueListenableBuilder<String>(
            valueListenable: addressValue,
            builder: (context, value, child) {
              return value.isEmpty
                  ? Row(
                      children: [
                        AddButton(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push<dynamic>(
                              context,
                              newRoute(
                                const AddAddressScreen(),
                              ),
                            );
                          },
                        ),
                        horizontalSpaceSmall,
                        horizontalSpaceSmall,
                        BoxText.headline(
                          'Salgy goş',
                          color: kcPrimaryColor,
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: Text(value)),
                        IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push<dynamic>(
                              context,
                              newRoute(
                                const AddAddressScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    );
            },
          ),
        );

      case EnumProfileAddSections.phone:
        return AddSection(
          widget: enteredValue.isEmpty
              ? Row(
                  children: [
                    AddButton(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          newRoute<String>(
                            const AddPhoneNumber(),
                          ),
                        ).then((value) {
                          if (value != null && value.isNotEmpty) {
                            _onValueChanged(value);
                          }
                        });
                      },
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceSmall,
                    BoxText.headline(
                      'Telefon belgi goş',
                      color: kcPrimaryColor,
                    )
                  ],
                )
              : Row(
                  children: [
                    Text(enteredValue),
                  ],
                ),
          onTap: () {},
        );
      case EnumProfileAddSections.position:
        return AddSection(
          widget: enteredValue.isEmpty
              ? Row(
                  children: [
                    AddButton(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          newRoute<String>(
                            const AddProfession(),
                          ),
                        ).then((value) {
                          if (value != null && value.isNotEmpty) {
                            _onValueChanged(value);
                          }
                        });
                      },
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceSmall,
                    BoxText.headline(
                      'Wezipe goş',
                      color: kcPrimaryColor,
                    )
                  ],
                )
              : Row(
                  children: [
                    Text(enteredValue),
                  ],
                ),
        );
      case EnumProfileAddSections.employmentType:
        return AddSection(
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
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      case EnumProfileAddSections.salary:
        return AddSection(
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomInputField(
                controller: widget.salaryFromController,
                borderColor: kcLightestGreyColor,
              ),
              BoxText.body('-dan'),
              CustomInputField(
                controller: widget.salaryToController,
                borderColor: kcLightestGreyColor,
              ),
              BoxText.body('-çenli'),
            ],
          ),
        );
      case EnumProfileAddSections.image:
        return AddSection(
          widget: Row(
            children: [
              AddButton(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              horizontalSpaceSmall,
              horizontalSpaceSmall,
              BoxText.headline(
                'Surat goşuň',
                color: kcPrimaryColor,
              )
            ],
          ),
        );
      case EnumProfileAddSections.activeDays:
        return const AddSection(
          customHeight: 100,
          widget: SliderWidget(),
        );
      case EnumProfileAddSections.description:
        return AddSection(
          customHeight: 120,
          widget: TextField(
            controller: widget.descriptionController,
            maxLines: 8,
            decoration: const InputDecoration.collapsed(
              hintText: 'Goşmaça bildirişleriňizi şu ýere ýazyp bilersiňiz',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kcHardGreyColor,
              ),
            ),
          ),
        );
      case EnumProfileAddSections.name:
      // ignore: no_default_cases
      default:
        return AddSection(
          widget: SizedBox(
            height: 50.h,
            width: 339.w,
            child: TextField(
              controller: widget.nameController,
              onSubmitted: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kcLightestGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(10).w,
                ),
                hintText: 'Ýazyň...',
                contentPadding: REdgeInsets.only(left: 34),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).w,
                  borderSide: const BorderSide(
                    color: kcHardGreyColor,
                  ),
                ),
                hintStyle: TextStyle(
                  color: kcHardGreyColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
    }
  }

  MaterialPageRoute<T> newRoute<T>(Widget widget) {
    return MaterialPageRoute<T>(
      builder: (context) => widget,
    );
  }
}

enum EnumProfileAddSections {
  adsType,
  name,
  address,
  phone,
  position,
  employmentType,
  salary,
  image,
  activeDays,
  description,
}

// class AddProfileValues {
//   AddProfileValues._();

//   static AddProfileValues get instance => _instance!;

//   @protected
//   static AddProfileValues? _instance;

//   factory AddProfileValues() {
//     return _instance ??= AddProfileValues._();
//   }

//   ValueNotifier<String> addressValue = ValueNotifier('');
//   ValueNotifier<String> phoneValue = ValueNotifier('');
//   ValueNotifier<String> positionValue = ValueNotifier('');
//   ValueNotifier<String> imageValue = ValueNotifier('');
//   ValueNotifier<String> employmentTypeValue = ValueNotifier('');
//   ValueNotifier<double> activeDaysValue = ValueNotifier(1);
// }

typedef ValueEntered<T> = void Function(T a, EnumProfileAddSections b);

ValueNotifier<String> addressValue = ValueNotifier('');
