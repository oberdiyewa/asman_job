import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/search_work/add_notif_forwork.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
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
        ? hasDataNotificationScreen()
        : noDataNotificationScreen(context);
  }

  Widget hasDataNotificationScreen() {
<<<<<<< HEAD
    return Text(notifData!.jobName);
=======
    return Container(
      // width: screenWidth(context),
      // height: 72.h,
      color: Color.fromRGBO(241, 241, 241, 1),
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          Container(
            width: 365.w,
            height: 113.h,
            margin: REdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 2,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 43.w,
                      height: 43.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kcPrimaryColor.withOpacity(0.15),
                      ),
                      child: SvgPicture.asset(Assets.notifAvatar),
                    ),

                  ],
                ),
                Row(
                  children: [],
                )
              ],
            ),
          ),
        ],
      ),
    );
>>>>>>> 8cb906d (notification result screen modified)
  }

  Container noDataNotificationScreen(BuildContext context) {
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

/*
 Container(
            width: screenWidth(context),
            height: 72.h,
            color: Colors.white,
            child: ListTile(
              selectedTileColor: Colors.red,
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(Assets.notifAvatar),
              ),
              title: BoxText.headline('Iş gözleýän'),
              subtitle: BoxText.body('Satyjy, Ýarym iş güni'),
              trailing: SvgPicture.asset(Assets.arrowForward),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: BoxButton.large(
              title: 'Bildiriş ber',
              onTap: () {
                Navigator.push<NotificationModel>(
                  context,
                  MaterialPageRoute<NotificationModel>(
                    builder: (context) => const AddForWorkNotif(),
                  ),
                );
              },
            ),
          )
*/
