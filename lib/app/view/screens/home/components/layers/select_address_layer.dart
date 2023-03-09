import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/utils/settings/extentions.dart';
import 'package:flutter/material.dart';

class SelectedAddressLayer extends StatelessWidget {
  const SelectedAddressLayer({
    required this.isPointerDown,
    super.key,
  });

  final bool isPointerDown;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.myLocation),
          if (isPointerDown) 5.0.boxH,
          Container(
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.elliptical(200, 100)),
            ),
            height: 8,
            width: 20,
          )
        ],
      ),
    );
  }
}
