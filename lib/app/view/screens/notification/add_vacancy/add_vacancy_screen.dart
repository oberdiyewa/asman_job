import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:asman_work/app/view/screens/notification/add_address/add_address_screen.dart';
import 'package:asman_work/app/view/screens/notification/add_phone.dart';
import 'package:asman_work/app/view/screens/notification/add_profession.dart';
import 'package:asman_work/app/view/screens/notification/bloc/bloc.dart';
import 'package:asman_work/app/view/screens/notification/notif_widgets.dart';
import 'package:asman_work/app/view/screens/notification/section_add.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/utils/settings/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpansionTileElement {
  ExpansionTileElement(
    this.name, {
    this.selected = false,
    this.avatarUrl,
    this.avatarNumber,
    this.code,
  });
  final String name;
  final bool selected;
  final String? avatarUrl;
  final int? avatarNumber;
  final String? code;

  ExpansionTileElement copy({
    String? name,
    bool? selected,
    String? avatarUrl,
    int? avatarNumber,
    String? code,
  }) {
    return ExpansionTileElement(
      name ?? this.name,
      selected: selected ?? this.selected,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      avatarNumber: avatarNumber ?? this.avatarNumber,
      code: code ?? this.code,
    );
  }
}

class ChoiceWorkType {
  ChoiceWorkType(this.name, {this.selected = false});

  final String name;
  final bool selected;

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

class AddVacancyScreen extends StatefulWidget {
  const AddVacancyScreen({super.key, this.vacancy});
  final UserVacancy? vacancy;

  @override
  State<AddVacancyScreen> createState() => _AddVacancyScreenState();
}

class _AddVacancyScreenState extends State<AddVacancyScreen> {
  late final TextEditingController descriptionController;
  late final TextEditingController organizationTitleController;
  late final TextEditingController salaryFromController;
  late final TextEditingController salaryToController;

  List<Map<String, String>> sectionTextList = [];

  late final VacancyValueNotifiers notifiers;

  late final UserFetchedSuccess userState;

  void initValues() {
    VacancyValueNotifiers();
    VacancyValueNotifiers.reInitializeNotifiers();
    notifiers = VacancyValueNotifiers.instance!;
    if (widget.vacancy != null) {
      print(widget.vacancy!.empType);
      final userCatalogueState = context.read<UserCatalogueBloc>().state;
      final employmentType = (userCatalogueState as UserCatalogueLoaded)
          .userCatalogue
          .employmentType!
          .firstWhere((element) => element.code == widget.vacancy!.empType);

      notifiers.setInitialValues(widget.vacancy!, employmentType.title);
    }
  }

  @override
  void initState() {
    initValues();
    descriptionController = TextEditingController(
      text: widget.vacancy != null ? widget.vacancy!.description : null,
    );
    organizationTitleController = TextEditingController(
      text: widget.vacancy != null ? widget.vacancy!.employerTitle : null,
    );
    salaryFromController = TextEditingController(
      text:
          widget.vacancy != null ? widget.vacancy!.salaryFrom.toString() : null,
    );
    salaryToController = TextEditingController(
      text: widget.vacancy != null ? widget.vacancy!.salaryTo.toString() : null,
    );
    userState = context.read<UserBloc>().state as UserFetchedSuccess;
    sectionTextList = [
      {
        'sectionName': 'Giňişleýin adresiňiz',
        'helperText': 'Salgy goş',
      },
      {
        'sectionName': 'Telefon belgi goş',
        'helperText': 'Telefon belgi goş',
      },
      {
        'sectionName': 'Wezipe',
        'helperText': 'Wezipe gos',
      },
      {
        'sectionName': 'Iş tertibi saýla',
        'helperText': 'Saýlaň (Doly iş güni, Ýarym iş güni we ş.m)',
      },
      {},
      {
        'sectionName': 'Surat goş',
        'helperText': 'Surat goşuň',
      },
      {
        'sectionName': 'Online wagty',
        'helperText': '',
      },
    ];
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = userState.user;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: JobBaseAppbar(
        title: 'Işgar gozleyan',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<UserCatalogueBloc, UserCatalogueState>(
        builder: (context, state) {
          return Stack(
            children: [
              ListView(
                children: [
                  const SectionName(
                    headlineWord: 'Organizasiya ady',
                  ),
                  AddSection(
                    widget: TextField(
                      controller: organizationTitleController,
                      decoration: const InputDecoration(
                        hintText: 'Yazyn...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kcHardGreyColor,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ...List.generate(EnumVacancyAddSections.values.length,
                      (index) {
                    if (EnumVacancyAddSections.values[index] ==
                        EnumVacancyAddSections.salary) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionName(
                            headlineWord: 'Aylyk haky',
                          ),
                          AddSection(
                            widget: Row(
                              children: [
                                CustomInputField(
                                  controller: salaryFromController,
                                  borderColor: kcLightestGreyColor,
                                ),
                                5.boxW,
                                BoxText.body('-dan'),
                                const Spacer(),
                                CustomInputField(
                                  controller: salaryToController,
                                  borderColor: kcLightestGreyColor,
                                ),
                                5.boxW,
                                BoxText.body('-çenli'),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return AddVacancySection(
                        catalogueState: state,
                        section: EnumVacancyAddSections.values[index],
                        sectionText: sectionTextList[index],
                        vacancy: widget.vacancy,
                      );
                    }
                  }),
                  const SectionName(
                    headlineWord: 'Bildiriş barada goşmaça maglumaty',
                  ),
                  AddSection(
                    customHeight: 120,
                    widget: TextField(
                      controller: descriptionController,
                      maxLines: 8,
                      decoration: const InputDecoration.collapsed(
                        hintText:
                            'Goşmaça maglumatlaryňyzy şu ýere ýazyp bilersiňiz',
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
                  widget: BlocConsumer<UserVacancyBloc, UserVacancyState>(
                    listener: (context, state) {
                      if (state is UserVacancyAddSuccess) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return BoxButton.block(
                        title: confirmButtonTitle,
                        busy: state is UserVacancyLoading,
                        onTap: () {
                          if (state is! UserVacancyLoading) {
                            FocusScope.of(context).unfocus();
                            showDialog<dynamic>(
                              context: context,
                              builder: (BuildContext ctx) {
                                return JobAlertDialog(
                                  button2: GestureDetector(
                                    child: BoxButton.small(
                                      title: 'Tassykla',
                                      onTap: () {
                                        onConfirm(user);
                                        Navigator.pop(ctx);
                                      },
                                    ),
                                  ),
                                  button1: BoxButton.small(
                                      title: 'Goýbolsun',
                                      onTap: () {
                                        Navigator.pop(ctx);
                                      }),
                                  contentText: Column(
                                    children: [
                                      SvgPicture.asset(Assets.infoIcon),
                                      verticalSpaceSmall,
                                      BoxText.headline(
                                          'Bildirişiňizi tassyklaň'),
                                      const Divider(),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
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

  void onConfirm(User user) {
    final vacancy = UserVacancy(
      id: 0,
      userId: 0,
      title: notifiers.professionValue.value,
      employerTitle: organizationTitleController.text,
      contactPhone: [notifiers.phoneValue.value],
      empType: notifiers.empCodeValue.value,
      description: descriptionController.text,
      industryId: 1,
      salaryFrom: int.tryParse(salaryFromController.text),
      salaryTo: int.tryParse(salaryToController.text),
      expirationDays: notifiers.activeDaysValue.value,
      avatarNumber: notifiers.avatarValue.value,
      createdAt: '',
      expiresAt: '',
    ).toMap();
    if (widget.vacancy == null) {
      context.read<UserVacancyBloc>().add(
            UserVacancyAddEvent(vacancy),
          );
    } else {
      context.read<UserVacancyBloc>().add(
            UserVacancyUpdateEvent(
              vacancy,
              widget.vacancy!.id,
            ),
          );
    }
  }

  String get confirmButtonTitle {
    return widget.vacancy != null ? 'Uytget' : 'Bildiriş goş';
  }
}

class AddVacancySection extends StatefulWidget {
  const AddVacancySection({
    required this.section,
    required this.sectionText,
    required this.catalogueState,
    this.vacancy,
    super.key,
  });

  final EnumVacancyAddSections section;
  final Map<String, String> sectionText;
  final UserCatalogueState catalogueState;
  final UserVacancy? vacancy;

  @override
  State<AddVacancySection> createState() => _AddVacancySectionState();
}

class _AddVacancySectionState extends State<AddVacancySection> {
  bool isExpand = false;

  String selectedExpansionValue = '';

  List<ExpansionTileElement> expansionTileElements = [];

  late final VacancyValueNotifiers notifiers;

  void _selectedElement(ExpansionTileElement element) {
    final newList = List<ExpansionTileElement>.from(expansionTileElements);

    for (var i = 0; i < newList.length; i++) {
      final item = newList[i];

      if (item.name == element.name && item.selected) {
        return;
      } else if (item.name == element.name && item.selected == false) {
        newList[i] = item.copy(selected: true);
        continue;
      }
      // unselect all others
      newList[i] = item.copy(selected: false);
    }
    selectedExpansionValue = element.name;
    if (widget.section == EnumVacancyAddSections.employmentType) {
      notifiers.empTypeValue.value = element.name;
      notifiers.empCodeValue.value = element.code!;
    }
    if (widget.section == EnumVacancyAddSections.image) {
      notifiers.imageValue.value = element.name;
    }
    // update state
    expansionTileElements = newList;

    setState(() {});
  }

  Widget expansionTitle(bool _isExpand, {required bool isImageField}) {
    if (_isExpand) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxText.headline(
            'Birini saýlaň',
            color: kcHardGreyColor,
          ),
          const Divider()
        ],
      );
    } else {
      if (isImageField) {
        return ValueListenableBuilder<int?>(
          valueListenable: notifiers.avatarValue,
          builder: (context, value, child) {
            if (value != null) {
              return Row(
                children: [
                  Image.network(
                    expansionTileElements[value - 1].avatarUrl!,
                    height: 40,
                    width: 40,
                  ),
                  10.boxW,
                  BoxText.headline(
                    selectedExpansionValue,
                    color: kcPrimaryColor,
                  ),
                ],
              );
            } else {
              return BoxText.headline(
                selectedExpansionValue,
                color: kcPrimaryColor,
              );
            }
          },
        );
      } else {
        return BoxText.headline(
          selectedExpansionValue,
          color: kcPrimaryColor,
        );
      }
    }
  }

  @override
  void initState() {
    notifiers = VacancyValueNotifiers.instance!;
    if (widget.section == EnumVacancyAddSections.employmentType) {
      selectedExpansionValue = notifiers.empTypeValue.value.isNotEmpty
          ? notifiers.empTypeValue.value
          : widget.sectionText['helperText']!;
      if (widget.catalogueState is UserCatalogueLoaded) {
        final employmentTypeList =
            (widget.catalogueState as UserCatalogueLoaded)
                    .userCatalogue
                    .employmentType ??
                [];
        expansionTileElements = employmentTypeList
            .map<ExpansionTileElement>(
              (e) => ExpansionTileElement(e.title, code: e.code),
            )
            .toList();
      }
    }

    if (widget.section == EnumVacancyAddSections.image) {
      selectedExpansionValue = notifiers.avatarValue.value != null
          ? 'Avatar ${notifiers.avatarValue.value}'
          : widget.sectionText['helperText']!;
      if (widget.catalogueState is UserCatalogueLoaded) {
        final avatarList = (widget.catalogueState as UserCatalogueLoaded)
                .userCatalogue
                .vacancyAvatars ??
            [];
        expansionTileElements = [
          for (var e in avatarList)
            ExpansionTileElement(
              'Avatar ${e.number}',
              avatarUrl: e.avatarUrl,
              avatarNumber: e.number,
            )
        ];
      }
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
            headlineWord: widget.sectionText['sectionName'],
          ),
          sectionwidget(widget.section),
        ],
      ),
    );
  }

  Widget sectionwidget(EnumVacancyAddSections section) {
    switch (section) {
      case EnumVacancyAddSections.employmentType:
        return AddSection(
          hasChildren: true,
          widget: ExpansionTile(
            onExpansionChanged: (bool isExapnd) {
              setState(() {
                isExpand = isExapnd;
              });
            },
            title: expansionTitle(isExpand, isImageField: false),
            children: expansionTileElements.map((choice) {
              return Row(
                children: [
                  Checkbox(
                      activeColor: kcPrimaryColor,
                      side: const BorderSide(
                        width: 1.5,
                        color: Color.fromRGBO(62, 82, 188, 0.25),
                      ),
                      value: choice.selected,
                      onChanged: (v) {
                        _selectedElement(choice);
                      }),
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
      case EnumVacancyAddSections.image:
        return AddSection(
          hasChildren: true,
          widget: ExpansionTile(
              onExpansionChanged: (bool isExapnd) {
                setState(() {
                  isExpand = isExapnd;
                });
              },
              title: expansionTitle(isExpand, isImageField: true),
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ...expansionTileElements.map(
                      (choice) {
                        return GestureDetector(
                          onTap: () {
                            _selectedElement(choice);
                            notifiers.avatarValue.value = choice.avatarNumber;
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: choice.selected
                                        ? kcPrimaryColor
                                        : Colors.grey[300]!,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(choice.avatarUrl!),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(choice.name),
                            ],
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ]),
        );
      case EnumVacancyAddSections.activeDays:
        return AddSection(
          customHeight: 100,
          widget: SliderWidget(
            valueNotifier: notifiers.activeDaysValue,
          ),
        );

////////////// ------------------ -/////////// --------- //////////////
      ///

      case EnumVacancyAddSections.profession:
        return AddSection(
          widget: AddSectionValue(
              valueNotifier: notifiers.professionValue,
              sectionText: widget.sectionText,
              onTap: () {
                Navigator.push(
                  context,
                  newRoute<dynamic>(
                    AddProfession(
                      valueNotifier: notifiers.professionValue,
                    ),
                  ),
                );
              }),
        );

      case EnumVacancyAddSections.address:
        return AddSection(
          widget: AddSectionValue(
            valueNotifier: notifiers.addressValue,
            sectionText: widget.sectionText,
            onTap: () {
              Navigator.push(
                context,
                newRoute<dynamic>(
                  AddAddressScreen(
                    id : widget.vacancy?.id,
                    valueNotifier: notifiers.addressValue,
                  ),
                ),
              );
            },
          ),
        );

      case EnumVacancyAddSections.phone:
      // ignore: no_default_cases
      default:
        return AddSection(
          widget: AddSectionValue(
              valueNotifier: notifiers.phoneValue,
              sectionText: widget.sectionText,
              onTap: () {
                Navigator.push(
                  context,
                  newRoute<dynamic>(
                    AddPhoneNumber(
                      valueNotifier: notifiers.phoneValue,
                    ),
                  ),
                );
              }),
        );
    }
  }

  MaterialPageRoute<T> newRoute<T>(Widget widget) {
    return MaterialPageRoute<T>(
      builder: (context) => widget,
    );
  }
}

class AddSectionValue extends StatelessWidget {
  const AddSectionValue({
    required this.valueNotifier,
    required this.sectionText,
    required this.onTap,
    super.key,
  });

  final ValueNotifier<String> valueNotifier;
  final Map<String, dynamic> sectionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return value.isEmpty
            ? Row(
                children: [
                  AddButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      onTap();
                    },
                  ),
                  horizontalSpaceSmall,
                  horizontalSpaceSmall,
                  BoxText.headline(
                    sectionText['helperText'] as String,
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
                      onTap();
                    },
                    icon: const Icon(Icons.edit),
                  )
                ],
              );
      },
    );
  }

  MaterialPageRoute<T> newRoute<T>(Widget widget) {
    return MaterialPageRoute<T>(
      builder: (context) => widget,
    );
  }
}

enum EnumVacancyAddSections {
  address,
  phone,
  profession,
  employmentType,
  salary,
  image,
  activeDays,
}

class VacancyValueNotifiers {
  factory VacancyValueNotifiers() => instance ??= VacancyValueNotifiers._();
  VacancyValueNotifiers._();

  static VacancyValueNotifiers? instance;

  ValueNotifier<String> employerTitle = ValueNotifier('');
  ValueNotifier<String> addressValue = ValueNotifier('');
  ValueNotifier<String> phoneValue = ValueNotifier('');
  ValueNotifier<String> professionValue = ValueNotifier('');
  ValueNotifier<String> empTypeValue = ValueNotifier('');
  ValueNotifier<String> empCodeValue = ValueNotifier('');
  ValueNotifier<int?> avatarValue = ValueNotifier(null);
  ValueNotifier<String> imageValue = ValueNotifier('');
  ValueNotifier<int> activeDaysValue = ValueNotifier(1);

  static void reInitializeNotifiers() {
    instance = VacancyValueNotifiers._();
  }

  void setInitialValues(UserVacancy vacancy, String? employmentTitle) {
    employerTitle.value = vacancy.employerTitle;
    professionValue.value = vacancy.title;
    empTypeValue.value = employmentTitle ?? '';
    empCodeValue.value = vacancy.empType;
    addressValue.value = '';
    phoneValue.value = vacancy.contactPhone[0];
    avatarValue.value = vacancy.avatarNumber ?? 1;
    imageValue.value = '';
    activeDaysValue.value = vacancy.expirationDays ?? 1;
  }
}


// class AddVacancyScreen extends StatefulWidget {
//   const AddVacancyScreen({super.key});

//   @override
//   State<AddVacancyScreen> createState() => _AddVacancyScreenState();
// }

// class _AddVacancyScreenState extends State<AddVacancyScreen> {
//   bool isChecked = false;
//   bool isMounted = false;
//   bool isExpand = false;
//   bool isMountedforPhone = false;

//   String selectedWorkType = 'Saýlaň (Doly iş güni, Ýarym iş güni we ş.m)';
//   String finalResult = 'Wezipe gosh';
//   String phoneNumber = 'Telefon belgi goş';
//   final _customTileExpanded = false;
//   List<ChoiceWorkType> workTypes = [
//     ChoiceWorkType('Doly iş güni'),
//     ChoiceWorkType('Ýarym iş güni'),
//     ChoiceWorkType('Möwsümleýin'),
//     ChoiceWorkType('Meýletin'),
//     ChoiceWorkType('Tejribe '),
//     ChoiceWorkType('Taslama esasynda'),
//     ChoiceWorkType('Uzakdan işlemek '),
//   ];

//   void _selectChoice(ChoiceWorkType c) {
//     final newList = List<ChoiceWorkType>.from(workTypes);

//     for (var i = 0; i < newList.length; i++) {
//       final item = newList[i];

//       if (item.name == c.name && item.selected) {
//         return;
//       } else if (item.name == c.name && item.selected == false) {
//         newList[i] = item.copy(selected: true);
//         continue;
//       }
//       // unselect all others
//       newList[i] = item.copy(selected: false);
//     }
//     selectedWorkType = c.name;
//     // update state
//     workTypes = newList;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     final catalogueBlocState = context.read<UserCatalogueBloc>().state;
//     if (catalogueBlocState is! UserCatalogueLoaded) {
//       context.read<UserCatalogueBloc>().add(UserCatalogueFetchEvent());
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
//       appBar: JobBaseAppbar(
//         title: 'Bildiriş ber',
//         onBack: () {
//           Navigator.pop(context);
//         },
//       ),
//       body: Stack(
//         children: [
//           ListView(
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SectionName(
//                 headlineWord: 'Bildiriş görnüşi',
//               ),
//               AddSection(
//                 widget: Row(
//                   children: [
//                     Container(
//                       width: 20.w,
//                       height: 20.h,
//                       // margin: REdgeInsets.only(left: 23),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: kcPrimaryColor,
//                         // borderRadius: BorderRadius.circular(30),
//                         border: Border.all(color: Colors.white, width: 3),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color.fromRGBO(0, 0, 0, 0.25),
//                             blurRadius: 2,
//                             offset: Offset(0, 1),
//                           )
//                         ],
//                       ),
//                     ),
//                     horizontalSpaceSmall,
//                     horizontalSpaceTiny,
//                     BoxText.body('Işgär gözleýän')
//                   ],
//                 ),
//               ),
//               const SectionName(headlineWord: 'Ady'),
//               AddSection(
//                 widget: BoxInputField(
//                   controller: TextEditingController(),
//                   placeholder: 'Ýazyň...',
//                   borderColor: kcLightestGreyColor,
//                 ),
//               ),
//               const SectionName(
//                 headlineWord: 'Giňişleýin salgyňyz',
//               ),
//               AddSection(
//                 widget: Row(
//                   children: [
//                     AddButton(
//                       onTap: () {
//                         Navigator.push<dynamic>(
//                           context,
//                           MaterialPageRoute<dynamic>(
//                             builder: (context) => const AddAddressScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                     horizontalSpaceSmall,
//                     horizontalSpaceSmall,
//                     BoxText.headline(
//                       'Salgy goş',
//                       color: kcPrimaryColor,
//                     )
//                   ],
//                 ),
//               ),
//               const SectionName(headlineWord: 'Telefon belgi goş '),
//               if (isMountedforPhone == false)
//                 AddSection(
//                   widget: Row(
//                     children: [
//                       AddButton(
//                         onTap: () {
//                           getPhoneNumberAndReturnResult(context);
//                         },
//                       ),
//                       horizontalSpaceSmall,
//                       horizontalSpaceSmall,
//                       BoxText.headline(
//                         phoneNumber,
//                         color: kcPrimaryColor,
//                       )
//                     ],
//                   ),
//                 )
//               else
//                 AddSection(
//                   widget: Row(
//                     children: [
//                       const PhoneButton(),
//                       horizontalSpaceSmall,
//                       horizontalSpaceSmall,
//                       BoxText.headline(
//                         phoneNumber,
//                         color: kcPrimaryColor,
//                       )
//                     ],
//                   ),
//                 ),
//               const SectionName(headlineWord: 'Wezipe'),
//               if (!isMounted)
//                 AddSection(
//                   widget: Row(
//                     children: [
//                       AddButton(
//                         onTap: () {
//                           selectProfessionAndReturnResult(context);
//                         },
//                       ),
//                       horizontalSpaceSmall,
//                       horizontalSpaceSmall,
//                       BoxText.headline(
//                         finalResult,
//                         color: kcPrimaryColor,
//                       )
//                     ],
//                   ),
//                 )
//               else
//                 AddSection(
//                   widget: Container(
//                     width: 339.w,
//                     height: 50.h,
//                     margin: REdgeInsets.fromLTRB(1, 1, 1, 1),
//                     padding: REdgeInsets.only(
//                       top: 10,
//                       bottom: 10,
//                       left: 23,
//                       right: 20,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(color: kcLightestGreyColor),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         BoxText.body(finalResult),
//                         GestureDetector(
//                           onTap: () {
//                             selectProfessionAndReturnResult(context);
//                           },
//                           child: const Icon(
//                             Icons.edit,
//                             color: kcPrimaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               const SectionName(
//                 headlineWord: 'Iş tertibi saýla',
//               ),
//               AddSection(
//                 hasChildren: true,
//                 widget: ExpansionTile(
//                   onExpansionChanged: (bool isExapnd) {
//                     setState(() {
//                       isExpand = isExapnd;
//                     });
//                   },
//                   title: isExpand
//                       ? Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             BoxText.headline(
//                               'Birini saýlaň',
//                               color: kcHardGreyColor,
//                             ),
//                             const Divider()
//                           ],
//                         )
//                       : BoxText.headline(
//                           selectedWorkType,
//                           color: kcPrimaryColor,
//                         ),
//                   children: workTypes.map((choice) {
//                     return Row(
//                       children: [
//                         Checkbox(
//                           activeColor: kcPrimaryColor,
//                           side: const BorderSide(
//                             width: 1.5,
//                             color: Color.fromRGBO(62, 82, 188, 0.25),
//                           ),
//                           value: choice.selected,
//                           onChanged: (v) => _selectChoice(choice),
//                         ),
//                         // horizontalSpaceSmall,
//                         Text(
//                           choice.name,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SectionName(
//                 headlineWord: 'Ýaş derejesini saýla',
//               ),
//               AddSection(
//                 widget: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomInputField(
//                       controller: TextEditingController(),
//                       borderColor: kcLightestGreyColor,
//                     ),
//                     BoxText.body('-dan'),
//                     CustomInputField(
//                       controller: TextEditingController(),
//                       borderColor: kcLightestGreyColor,
//                     ),
//                     BoxText.body('-çenli'),
//                   ],
//                 ),
//               ),
//               const SectionName(
//                 headlineWord: 'Aýlyk haky',
//               ),
//               AddSection(
//                 widget: BoxInputField(
//                   controller: TextEditingController(),
//                   placeholder: 'Ýazyň...',
//                   borderColor: kcLightestGreyColor,
//                 ),
//               ),
//               const SectionName(
//                 headlineWord: 'Surat goş',
//               ),
//               AddSection(
//                 widget: Row(
//                   children: [
//                     AddButton(
//                       onTap: () {},
//                     ),
//                     horizontalSpaceSmall,
//                     horizontalSpaceSmall,
//                     BoxText.headline(
//                       'Surat goşuň',
//                       color: kcPrimaryColor,
//                     )
//                   ],
//                 ),
//               ),
//               const SectionName(
//                 headlineWord: 'Online wagty: ',
//               ),
//               const AddSection(
//                 customHeight: 100,
//                 widget: SliderWidget(),
//               ),
//               const SectionName(
//                 headlineWord: 'Bildiriş barada goşmaça maglumaty',
//               ),
//               const AddSection(
//                 customHeight: 120,
//                 widget: TextField(
//                   maxLines: 8,
//                   decoration: InputDecoration.collapsed(
//                     hintText:
//                         'Goşmaça bildirişleriňizi şu ýere ýazyp bilersiňiz',
//                     hintStyle: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: kcHardGreyColor,
//                     ),
//                   ),
//                 ),
//               ),
//               const SectionName(
//                 headlineWord: ' ',
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 1,
//             child: AddSection(
//               widget: BoxButton.block(
//                 title: 'Bildiriş goş',
//                 onTap: () {
//                   showDialog<dynamic>(
//                     context: context,
//                     builder: (ctx) => JobAlertDialog(
//                       button2: GestureDetector(
//                         child: const BoxButton.small(title: 'Tassykla'),
//                       ),
//                       button1: const BoxButton.small(title: 'Goýbolsun'),
//                       contentText: Column(
//                         children: [
//                           SvgPicture.asset(Assets.infoIcon),
//                           verticalSpaceSmall,
//                           BoxText.headline('Bildirişiňizi tassyklaň'),
//                           const Divider(),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> selectProfessionAndReturnResult(BuildContext context) async {
//     final result = await Navigator.push<String>(
//       context,
//       MaterialPageRoute<String>(builder: (context) => const AddProfession()),
//     );
//     debugPrint(result.toString());
//     if (mounted) {
//       setState(() {
//         isMounted = true;
//         finalResult = result ?? '';
//       });
//     }
//   }

//   Future<void> getPhoneNumberAndReturnResult(BuildContext context) async {
//     final result = await Navigator.push<String>(
//       context,
//       MaterialPageRoute<String>(builder: (context) => const AddPhoneNumber()),
//     );
//     debugPrint(result);
//     if (mounted) {
//       setState(() {
//         isMountedforPhone = true;
//         phoneNumber = result ?? '';
//       });
//     }
//   }
// }
