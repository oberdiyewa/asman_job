import 'package:flutter/material.dart';

class AppliedSectionTabbar extends StatefulWidget {
  const AppliedSectionTabbar({super.key});

  @override
  State<AppliedSectionTabbar> createState() => _AppliedSectionTabbarState();
}

class _AppliedSectionTabbarState extends State<AppliedSectionTabbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.pink,
      child: const Center(child: Text('tabshyranlarym')),
    );
    ;
  }
}
