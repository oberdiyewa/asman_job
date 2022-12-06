import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends AppBar {
  ProfileAppBar({super.key, this.topTitle});
  final String? topTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: BoxText.headingTwo(topTitle!),
    );
  }
}
