import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/add_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NotificationSectionTabbar extends StatefulWidget {
  const NotificationSectionTabbar({super.key});

  @override
  State<NotificationSectionTabbar> createState() =>
      _NotificationSectionTabbarState();
}

class _NotificationSectionTabbarState extends State<NotificationSectionTabbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241, 241, 241, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.empty),
          verticalSpaceLarge,
          verticalSpaceSmall,
          Padding(
            padding: REdgeInsets.only(left: 60, right: 60, bottom: 40),
            child: const Text(
              'Siz entek mahabat goýmadyňyz. Mugt gözleýän işiňiz ýa-da işgäriňiz üçin derrew mahabat ýerleşdirip bilersiňiz.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          BoxButton.large(
            title: 'Bildiriş ber',
            onTap: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const AddNotification(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
