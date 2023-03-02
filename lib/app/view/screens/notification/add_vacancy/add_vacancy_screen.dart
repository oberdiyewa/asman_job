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

  List<Map<String, String>> sectionTextList = [];

  late final VacancyValueNotifiers notifiers;

  late final UserFetchedSuccess userState;

  void initValues() {
    notifiers.clearNotifiers();
    if (widget.vacancy != null) {
      notifiers.setInitialValues(widget.vacancy!);
    }
  }

  @override
  void initState() {
    VacancyValueNotifiers();
    notifiers = VacancyValueNotifiers.instance!;
    initValues();
    descriptionController = TextEditingController(
      text: widget.vacancy != null ? widget.vacancy!.description : null,
    );
    userState = context.read<UserBloc>().state as UserFetchedSuccess;
    sectionTextList = [
      {
        'sectionName': 'Doglan senesi',
        'helperText': 'Doglan senanizi bellan',
      },
      {
        'sectionName': 'Wezipe',
        'helperText': 'Wezipe gos',
      },
      {
        'sectionName': 'Iş tertibi saýla',
        'helperText': 'Saýlaň (Doly iş güni, Ýarym iş güni we ş.m)',
      },
      {
        'sectionName': 'Iş tejribesini goşuň',
        'helperText': 'Iş tejribesi goş',
      },
      {
        'sectionName': 'Giňişleýin adresiňiz',
        'helperText': 'Salgy goş',
      },
      {
        'sectionName': 'Telefon belgi goş',
        'helperText': 'Telefon belgi goş',
      },
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
        title: 'Iş gozleyan',
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
                  ...List.generate(
                    EnumProfileAddSections.values.length,
                    (index) => AddProfileSection(
                      catalogueState: state,
                      section: EnumProfileAddSections.values[index],
                      sectionText: sectionTextList[index],
                    ),
                  ),
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
                  widget: BlocConsumer<UserProfileBloc, UserProfileState>(
                    listener: (context, state) {
                      if (state is UserProfileAddSuccess) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return BoxButton.block(
                        title: confirmButtonTitle,
                        busy: state is UserProfileLoading,
                        onTap: () {
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
                                    BoxText.headline('Bildirişiňizi tassyklaň'),
                                    const Divider(),
                                  ],
                                ),
                              );
                            },
                          );
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
    final profile = Profile(
      id: 0,
      userId: 0,
      name: user.firstname,
      surname: user.lastname,
      middleName: '',
      phone: notifiers.phoneValue.value,
      birthDate: notifiers.birthDateValue.value,
      title: notifiers.professionValue.value,
      aboutMe: descriptionController.text,
      avatarNumber: notifiers.avatarValue.value,
      createdAt: '',
    ).toMap();
    if (widget.vacancy == null) {
      context.read<UserProfileBloc>().add(
            UserProfileAddEvent(profile),
          );
    } else {
      context.read<UserProfileBloc>().add(
            UserProfileUpdateEvent(
              profile,
              widget.vacancy!.id,
            ),
          );
    }
  }

  String get confirmButtonTitle {
    return widget.vacancy != null ? 'Uytget' : 'Bildiriş goş';
  }
}

class AddProfileSection extends StatefulWidget {
  const AddProfileSection({
    required this.section,
    required this.sectionText,
    required this.catalogueState,
    super.key,
  });

  final EnumProfileAddSections section;
  final Map<String, String> sectionText;
  final UserCatalogueState catalogueState;

  @override
  State<AddProfileSection> createState() => _AddProfileSectionState();
}

class _AddProfileSectionState extends State<AddProfileSection> {
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
    if (widget.section == EnumProfileAddSections.employmentType) {
      notifiers.empTypeValue.value = element.name;
    }
    if (widget.section == EnumProfileAddSections.image) {
      notifiers.imageValue.value = element.name;
    }
    // update state
    expansionTileElements = newList;

    setState(() {});
  }

  Widget expansionTitle(bool _isExpand) {
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
      return BoxText.headline(
        selectedExpansionValue,
        color: kcPrimaryColor,
      );
    }
  }

  @override
  void initState() {
    notifiers = VacancyValueNotifiers.instance!;
    if (widget.section == EnumProfileAddSections.employmentType) {
      selectedExpansionValue = widget.sectionText['helperText']!;
      if (widget.catalogueState is UserCatalogueLoaded) {
        final employmentTypeList =
            (widget.catalogueState as UserCatalogueLoaded)
                    .userCatalogue
                    .employmentType ??
                [];
        expansionTileElements = employmentTypeList
            .map<ExpansionTileElement>((e) => ExpansionTileElement(e.title))
            .toList();
      }
    }

    if (widget.section == EnumProfileAddSections.image) {
      selectedExpansionValue = widget.sectionText['helperText']!;
      if (widget.catalogueState is UserCatalogueLoaded) {
        final avatarList = (widget.catalogueState as UserCatalogueLoaded)
                .userCatalogue
                .profileAvatars ??
            [];
        expansionTileElements = [
          for (var i = 0; i < avatarList.length; i++)
            ExpansionTileElement(
              'Avatar ${i + 1}',
              avatarUrl: avatarList[i].avatarUrl,
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

  Widget sectionwidget(EnumProfileAddSections section) {
    switch (section) {
      case EnumProfileAddSections.employmentType:
        return AddSection(
          hasChildren: true,
          widget: ExpansionTile(
            onExpansionChanged: (bool isExapnd) {
              setState(() {
                isExpand = isExapnd;
              });
            },
            title: expansionTitle(isExpand),
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
      case EnumProfileAddSections.image:
        return AddSection(
          hasChildren: true,
          widget: ExpansionTile(
              onExpansionChanged: (bool isExapnd) {
                setState(() {
                  isExpand = isExapnd;
                });
              },
              title: expansionTitle(isExpand),
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
                            notifiers.avatarValue.value =
                                expansionTileElements.indexOf(choice) + 1;
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
      case EnumProfileAddSections.activeDays:
        return const AddSection(
          customHeight: 100,
          widget: SliderWidget(),
        );

////////////// ------------------ -/////////// --------- //////////////
      ///
      case EnumProfileAddSections.birthDate:
        return AddSection(
          widget: AddSectionValue(
            valueNotifier: notifiers.birthDateValue,
            sectionText: widget.sectionText,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: notifiers.birthDateValue.value.isNotEmpty
                    ? dateFromString()
                    : DateTime(2013),
                firstDate: DateTime(
                  1960,
                ),
                lastDate: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  formattedDate(value);
                }
              });
            },
          ),
        );
      case EnumProfileAddSections.profession:
        return AddSection(
          widget: AddSectionValue(
              valueNotifier: notifiers.professionValue,
              sectionText: widget.sectionText,
              onTap: () {
                Navigator.push(
                  context,
                  newRoute<dynamic>(
                    const AddProfession(),
                  ),
                );
              }),
        );

      case EnumProfileAddSections.address:
        return AddSection(
          widget: AddSectionValue(
            valueNotifier: notifiers.addressValue,
            sectionText: widget.sectionText,
            onTap: () {
              Navigator.push(
                context,
                newRoute<dynamic>(
                  const AddAddressScreen(),
                ),
              );
            },
          ),
        );

      case EnumProfileAddSections.phone:
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
                    const AddPhoneNumber(),
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

  DateTime dateFromString() {
    final dateString = notifiers.birthDateValue.value;
    final splitted = dateString.split('-');

    return DateTime(
      int.parse(splitted[0]),
      int.parse(splitted[1]),
      int.parse(splitted[2]),
    );
  }

  void formattedDate(DateTime value) {
    final month = value.month < 10 ? '0${value.month}' : '${value.month}';
    final day = value.day < 10 ? '0${value.day}' : '${value.day}';
    final formattedDate = '${value.year}-$month-$day';
    notifiers.birthDateValue.value = formattedDate;
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

enum EnumProfileAddSections {
  birthDate,
  profession,
  employmentType,
  experience,
  address,
  phone,
  image,
  activeDays,
}

typedef ValueEntered<T> = void Function(T a, EnumProfileAddSections b);

class VacancyValueNotifiers {
  factory VacancyValueNotifiers() => instance ??= VacancyValueNotifiers._();
  VacancyValueNotifiers._();

  static VacancyValueNotifiers? instance;

  ValueNotifier<String> middleNameValue = ValueNotifier('');
  ValueNotifier<String> professionValue = ValueNotifier('');
  ValueNotifier<String> empTypeValue = ValueNotifier('');
  ValueNotifier<String> experienceValue = ValueNotifier('');
  ValueNotifier<String> addressValue = ValueNotifier('');
  ValueNotifier<String> phoneValue = ValueNotifier('');
  ValueNotifier<int> avatarValue = ValueNotifier(0);
  ValueNotifier<String> imageValue = ValueNotifier('');
  ValueNotifier<String> birthDateValue = ValueNotifier('');
  ValueNotifier<double> activeDaysValue = ValueNotifier(1);

  void clearNotifiers() {
    middleNameValue.value = '';
    professionValue.value = '';
    empTypeValue.value = '';
    experienceValue.value = '';
    addressValue.value = '';
    phoneValue.value = '';
    avatarValue.value = 0;
    imageValue.value = '';
    birthDateValue.value = '';
    activeDaysValue.value = 1;
  }

  void setInitialValues(UserVacancy vacancy) {
    middleNameValue.value = '';
    professionValue.value = vacancy.title;
    empTypeValue.value = '';
    experienceValue.value = '';
    addressValue.value = '';
    phoneValue.value = vacancy.contactPhone[0];
    avatarValue.value = vacancy.avatarNumber ?? 1;
    imageValue.value = '';
    birthDateValue.value = '';
    activeDaysValue.value = 1;
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
