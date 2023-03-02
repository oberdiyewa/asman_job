import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:asman_work/app/view/screens/notification/add_address/add_address_screen.dart';
import 'package:asman_work/app/view/screens/notification/add_phone.dart';
import 'package:asman_work/app/view/screens/notification/add_profession.dart';
import 'package:asman_work/app/view/screens/notification/add_vacancy/add_vacancy_screen.dart';
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

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key, this.profile});
  final Profile? profile;

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  late final TextEditingController descriptionController;
  late final TextEditingController middleNameController;

  List<Map<String, String>> sectionTextList = [];

  late final ProfileValueNotifiers notifiers;

  late final UserFetchedSuccess userState;

  void initValues() {
    notifiers.clearNotifiers();
    if (widget.profile != null) {
      notifiers.setInitialValues(widget.profile!);
      print('expdays ${widget.profile!.expirationDays}');
    }
  }

  @override
  void initState() {
    ProfileValueNotifiers();
    notifiers = ProfileValueNotifiers.instance!;
    initValues();
    middleNameController = TextEditingController(
      text: widget.profile != null ? widget.profile!.middleName : null,
    );
    descriptionController = TextEditingController(
      text: widget.profile != null ? widget.profile!.aboutMe : null,
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
                  const SectionName(
                    headlineWord: 'Atasynyn ady (Otchestwo)',
                  ),
                  AddSection(
                    widget: TextField(
                      controller: middleNameController,
                      decoration: const InputDecoration(
                        hintText: 'Atasynyn ady',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kcHardGreyColor,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
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
                          if (state is! UserProfileLoading) {
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
                                        'Bildirişiňizi tassyklaň',
                                      ),
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
    final profile = Profile(
      id: 0,
      userId: 0,
      name: user.firstname,
      surname: user.lastname,
      middleName: middleNameController.text,
      phone: notifiers.phoneValue.value,
      birthDate: notifiers.birthDateValue.value,
      title: notifiers.professionValue.value,
      aboutMe: descriptionController.text,
      avatarNumber: notifiers.avatarValue.value!,
      // empType: notifiers.empCodeValue.value,
      empType: 'FT',
      // expirationDays: notifiers.activeDaysValue.value,
      expirationDays: 60,
      createdAt: '',
    ).toMap();
    if (widget.profile == null) {
      context.read<UserProfileBloc>().add(
            UserProfileAddEvent(profile),
          );
    } else {
      context.read<UserProfileBloc>().add(
            UserProfileUpdateEvent(
              profile,
              widget.profile!.id,
            ),
          );
    }
  }

  String get confirmButtonTitle {
    return widget.profile != null ? 'Uytget' : 'Bildiriş goş';
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

  late final ProfileValueNotifiers notifiers;

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
      notifiers.empCodeValue.value = element.code!;
      print(notifiers.empCodeValue.value);
    }
    if (widget.section == EnumProfileAddSections.image) {
      notifiers.imageValue.value = element.name;
    }
    // update state
    expansionTileElements = newList;

    setState(() {});
  }

  Widget expansionTileTitle(bool _isExpand, {required bool isImageField}) {
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
    notifiers = ProfileValueNotifiers.instance!;
    if (widget.section == EnumProfileAddSections.employmentType) {
      selectedExpansionValue = widget.sectionText['helperText']!;
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

    if (widget.section == EnumProfileAddSections.image) {
      selectedExpansionValue = notifiers.avatarValue.value != null
          ? 'Avatar ${notifiers.avatarValue.value}'
          : widget.sectionText['helperText']!;
      if (widget.catalogueState is UserCatalogueLoaded) {
        final avatarList = (widget.catalogueState as UserCatalogueLoaded)
                .userCatalogue
                .profileAvatars ??
            [];
        expansionTileElements = [
          for (var e in avatarList)
            ExpansionTileElement('Avatar ${e.number}',
                avatarUrl: e.avatarUrl, avatarNumber: e.number)
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
            title: expansionTileTitle(isExpand, isImageField: false),
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
              title: expansionTileTitle(isExpand, isImageField: true),
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

class ProfileValueNotifiers {
  factory ProfileValueNotifiers() => instance ??= ProfileValueNotifiers._();
  ProfileValueNotifiers._();

  static ProfileValueNotifiers? instance;

  ValueNotifier<String> middleNameValue = ValueNotifier('');
  ValueNotifier<String> professionValue = ValueNotifier('');
  ValueNotifier<String> empTypeValue = ValueNotifier('');
  ValueNotifier<String> empCodeValue = ValueNotifier('');
  ValueNotifier<String> experienceValue = ValueNotifier('');
  ValueNotifier<String> addressValue = ValueNotifier('');
  ValueNotifier<String> phoneValue = ValueNotifier('');
  ValueNotifier<int?> avatarValue = ValueNotifier(null);
  ValueNotifier<String> imageValue = ValueNotifier('');
  ValueNotifier<String> birthDateValue = ValueNotifier('');
  ValueNotifier<int> activeDaysValue = ValueNotifier(1);

  void clearNotifiers() {
    middleNameValue.value = '';
    professionValue.value = '';
    empTypeValue.value = '';
    empCodeValue.value = '';
    experienceValue.value = '';
    addressValue.value = '';
    phoneValue.value = '';
    avatarValue.value = null;
    imageValue.value = '';
    birthDateValue.value = '';
    activeDaysValue.value = 1;
  }

  void setInitialValues(Profile profile) {
    middleNameValue.value = profile.middleName ?? '';
    professionValue.value = profile.title;
    empTypeValue.value = profile.empType ?? '';
    empCodeValue.value = profile.empType ?? '';
    experienceValue.value = '';
    addressValue.value = '';
    phoneValue.value = profile.phone;
    avatarValue.value = profile.avatarNumber;
    imageValue.value = profile.avatarUrl ?? '';
    birthDateValue.value = profile.birthDate!;
    activeDaysValue.value = profile.expirationDays ?? 1;
  }
}
