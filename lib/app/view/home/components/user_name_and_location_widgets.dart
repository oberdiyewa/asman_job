import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bloc/locale_cubit/locale_cubit.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:asman_work/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<Column>(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...AppLocales.all.map<ListTile>((locale) => ListTile(
                    onTap: () {
                      context
                          .read<LocaleCubit>()
                          .setLocale(locale.languageCode);
                      Navigator.pop(context);
                    },
                    leading: Text(
                      AppLocales.getFlags(locale.languageCode),
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),)
            ],
          ),
        );
      },
      child: Container(
        // width: 123.w,
        height: 40.h,
        constraints: const BoxConstraints(minWidth: 120),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: kcPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserFailure) {
              print('User failed : ${state.errorMessage}');
              showDialog<dynamic>(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text(state.errorMessage),
                      ),);
            }
          },
          builder: (context, userState) {
            var userName = '';
            if (userState is UserFetchedSuccess) {
              userName = ', ${userState.user.firstname}!';
            }
            return Text(
              'Salam$userName',
              style: const TextStyle(
                color: kcSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FindMyLocationWidget extends StatelessWidget {
  const FindMyLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50.w,
        height: 50.h,
        padding: REdgeInsets.all(12),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(child: SvgPicture.asset(Assets.showLocation)),
      ),
    );
  }
}

class CustomRadioWidget<T> extends StatelessWidget {
  const CustomRadioWidget({
    required this.isSelected,
    required this.onChanged,
    super.key,
    // required this.value,
    // required this.groupValue,
    // required this.onChanged,
    this.width = 16,
    this.height = 16,
  });
  // final T value;
  // final T groupValue;
  final VoidCallback? onChanged;
  final double width;
  final double height;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        margin: REdgeInsets.only(top: 5, bottom: 5),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(1, 1, 1, 0.25),
              blurRadius: 1.4,
              offset: Offset(0, 0.7),
            )
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            height: height - 5,
            width: width - 5,
            decoration: ShapeDecoration(
              color: isSelected == true ? kcPrimaryColor : Colors.white,
              shape: const CircleBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
