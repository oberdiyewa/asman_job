import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/services/map_service.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/main/bloc/location_bloc/location_bloc.dart';
import 'package:asman_work/app/view/main/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showModalBottomSheet<Column>(
        //   context: context,
        //   builder: (context) => Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       ...AppLocales.all.map<ListTile>(
        //         (locale) => ListTile(
        //           onTap: () {
        //             context.read<LocaleCubit>().setLocale(locale.languageCode);
        //             Navigator.pop(context);
        //           },
        //           leading: Text(
        //             AppLocales.getFlags(locale.languageCode),
        //             style: const TextStyle(fontSize: 32),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // );
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
                ),
              );
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

class FindMyLocationWidget extends StatefulWidget {
  const FindMyLocationWidget({super.key});

  @override
  State<FindMyLocationWidget> createState() => _FindMyLocationWidgetState();
}

class _FindMyLocationWidgetState extends State<FindMyLocationWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationLoadSuccess) {
          return GestureDetector(
            onTap: () {
              context.read<LocationBloc>().add(LocationStarted());
              MapService.instance.moveDelegate!(
                LatLng(state.position.latitude, state.position.longitude),
                13,
              );
            },
            child: _container(
              Center(
                child: SvgPicture.asset(Assets.showLocation),
              ),
            ),
          );
        } else {
          return _container(
            SizedBox(
              height: 25.h,
              width: 25.w,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        }
      },
    );
  }

  Container _container(Widget child) {
    return Container(
      width: 50.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: child,
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
