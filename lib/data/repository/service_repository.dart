import 'package:asman_work/data/model/service_adress.dart';
import 'package:asman_work/data/providers/remote/services_provider.dart';
import 'package:latlong2/latlong.dart';

final ServicesProvider _provider = ServicesProvider();

class ServicesRepository {
  Future<List<ServiceAddress>> searchedAddressList(String street) async {
    return _provider.getSearchedAddressList(street);
  }

  Future<ServiceAddress> searchedAddressByPoint(LatLng point) async {
    return _provider.getAddressByPoint(point);
  }

  Future<bool> addAddress(Map<String, dynamic> data, int prodileId) async {
    return _provider.addAddress(data, prodileId);
  }
}
