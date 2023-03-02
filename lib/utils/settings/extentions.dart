import 'dart:developer' as devtools show log;

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

extension Log on Object {
  void log({StackTrace? stackTrace}) => devtools.log(
        toString(),
        stackTrace: stackTrace,
      );
}

extension LocationExtension on Position {
  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}

extension EmptySpaceExtension on num {
  Widget get boxH => SizedBox(height: toDouble());
  Widget get boxW => SizedBox(width: toDouble());
}
