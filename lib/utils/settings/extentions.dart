import 'dart:developer' as devtools show log;

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
