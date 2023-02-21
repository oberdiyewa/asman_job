import 'package:asman_work/utils/globals/consts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationRepository {
  LocationRepository() : super();

  Future<Position?> get myLocation => _requestLocation();
  Position? currentLocation;

  LatLng get initialLocation => currentLocation == null
      ? AppConstants.ashgabatPosition
      : LatLng(currentLocation!.latitude, currentLocation!.longitude);
      
  Future<Position?> _requestLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return null;
    }

    currentLocation = await Geolocator.getCurrentPosition();
    return Geolocator.getCurrentPosition();
  }
}
