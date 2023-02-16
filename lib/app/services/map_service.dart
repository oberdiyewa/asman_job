import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  factory MapService() {
    return singleton ??= MapService._();
  }
  MapService._();

  static MapService? singleton;

  GoogleMapController? mapController;
}
