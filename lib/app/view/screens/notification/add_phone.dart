import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:asman_work/app/view/screens/home/components/custom_radio_widget.dart';
import 'package:asman_work/app/view/screens/notification/add_profile/add_profile_screen.dart';
import 'package:asman_work/app/view/screens/notification/section_add.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  bool isCurrentNumber = false;
  bool isEnableButton = false;

  late final TextEditingController _textController;
  late final ProfileValueNotifiers notifiers;

  @override
  void initState() {
    notifiers = ProfileValueNotifiers.instance!;
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(isEnableButton.toString());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: JobBaseAppbar(
        title: 'Telefon belgi goş ',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          verticalSpaceSmall,
          verticalSpaceTiny,
          AddSection(
            customHeight: 220,
            widget: Padding(
              padding: REdgeInsets.only(top: 14, bottom: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      borderLinedContainer(
                        widget: const Text(
                          '993',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      horizontalSpaceTiny,
                      borderLinedContainer(
                        width: 270,
                        widget: Padding(
                          padding: const EdgeInsets.only(bottom: 7, left: 10),
                          child: TextField(
                            maxLength: 8,
                            onChanged: (String phoneNumber) {
                              phoneNumber.length >= 8
                                  ? isEnableButton = true
                                  : isEnableButton = false;
                              debugPrint('isEnableButton:$isEnableButton');
                              notifiers.phoneValue.value = phoneNumber;
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            controller: _textController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceRegular,
                  Row(
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          final user = (state as UserFetchedSuccess).user;
                          return CustomRadioWidget<dynamic>(
                            isSelected: isCurrentNumber,
                            onChanged: () {
                              isCurrentNumber = !isCurrentNumber;
                              isCurrentNumber && (isEnableButton == false)
                                  ? isEnableButton = true
                                  : isEnableButton = false;

                              debugPrint(
                                isCurrentNumber.toString() +
                                    isEnableButton.toString(),
                              );
                              _textController.text = user.phone.substring(3);
                              setState(() {});
                            },
                          );
                        },
                      ),
                      horizontalSpaceSmall,
                      horizontalSpaceTiny,
                      BoxText.body('Häzirki belgini ulan'),
                    ],
                  ),
                  verticalSpaceRegular,
                  BoxButton.block(
                    title: 'Belgini goş',
                    disabled: !isEnableButton,
                    onTap: () {
                      notifiers.phoneValue.value = '993${_textController.text}';
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container borderLinedContainer({
    required Widget widget,
    double width = 60,
  }) {
    return Container(
      width: width.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kcLightestGreyColor, width: 2),
      ),
      child: Center(
        child: widget,
      ),
    );
  }
}
