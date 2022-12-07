import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/profile/profile_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ProfileAppBar());
  }
}
