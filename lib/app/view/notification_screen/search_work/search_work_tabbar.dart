import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_notif_forwork.dart';
import 'package:asman_work/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WorkSectionTabbar extends StatefulWidget {
  const WorkSectionTabbar({super.key});

  @override
  State<WorkSectionTabbar> createState() => _WorkSectionTabbarState();
}

class _WorkSectionTabbarState extends State<WorkSectionTabbar> {
  NotificationModel? notifData;
  @override
  Widget build(BuildContext context) {
    return notifData != null
        ? Center(
            child: Text(notifData!.jobName.toString()),
          )
        : Container(
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
                    debugPrint('bildirish ber');
                    Navigator.push<NotificationModel>(
                      context,
                      MaterialPageRoute<NotificationModel>(
                        builder: (context) => const AddForWorkNotif(),
                      ),
                    ).then((value) {
                      setState(() {
                        notifData = value;
                      });
                    });
                  },
                )
              ],
            ),
          );
  }
}
