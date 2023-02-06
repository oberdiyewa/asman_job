import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/home/components/button_widgets.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController textController = TextEditingController();

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  TextStyle subheadingStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: kcHardGreyColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: const BaseAppbar(
          title: 'Gizlinlik',
        ),
        body: ListView(
          children: [Text('data')],
        ));
  }
}
