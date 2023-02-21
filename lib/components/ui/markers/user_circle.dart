import 'package:asman_flutter_uikit/box_ui2.dart';
// import 'package:asman_work/app/services/map_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class UserCircle extends StatelessWidget {
  const UserCircle({
    required this.point,
    required this.radius,
    super.key,
  });

  final LatLng point;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // var r = calculateRealRadius(context: context, radius: radius, point: point);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle,
          ),
          width: radius,
          height: radius,
        ),
      ],
    );
  }
}
