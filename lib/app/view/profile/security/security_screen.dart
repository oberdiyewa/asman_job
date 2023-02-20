import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController textController = TextEditingController();

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  TextStyle subheadingStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: kcHardGreyColor,
  );
  bool _showProfilPicture = false;
  bool _showResume = false;

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: REdgeInsets.all(20),
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
            'Gizlinlik',
            color: kcSecondaryTextColor,
          ),
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 23, right: 23, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoxText.headline('Profil suratymy görkez '),
                      verticalSpaceTiny,
                      Text(
                        'Profildäki suratyňyz ähli ulanyjylara görüner ',
                        style: subheadingStyle,
                      )
                    ],
                  ),
                  Switch(
                    onChanged: (bool value) {
                      setState(() => _showProfilPicture = value);
                    },
                    value: _showProfilPicture,
                    thumbColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return kcPrimaryColor;
                      }
                      return kcPrimaryColor;
                    }),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoxText.headline('Profilde rezume-ny görkez'),
                      verticalSpaceTiny,
                      Text(
                        'Profildäki rezume-ňiz ähli ulanyjylara görüner  ',
                        style: subheadingStyle,
                      )
                    ],
                  ),
                  Switch(
                    onChanged: (bool value) {
                      setState(() => _showResume = value);
                    },
                    value: _showResume,
                    thumbColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return kcPrimaryColor;
                      }
                      return kcPrimaryColor;
                    }),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Text(
                ' *Howpsyzlygyňyz ucin öz şahsy maglumatlaryňyzy paylaşmazlyk maslahat berilyar',
                style: subheadingStyle.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),);
  }
}
