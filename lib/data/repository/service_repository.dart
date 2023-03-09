import 'package:asman_work/data/model/model.dart';
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

  Future<bool> addAddress(ServiceAddress address, int id) async {
    return _provider.addAddress(address, id);
  }

  Future<bool> updateAddress(
    ServiceAddress address, {
    required int id,
    required int addressId,
  }) async {
    return _provider.updateAddress(
      address,
      profileId: id,
      addressId: addressId,
    );
  }
}
