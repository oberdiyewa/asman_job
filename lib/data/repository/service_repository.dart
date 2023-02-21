import 'package:asman_work/data/model/service_adress.dart';
import 'package:asman_work/data/providers/remote/services_provider.dart';

final ServicesProvider _provider = ServicesProvider();

class ServicesRepository {
  Future<List<ServiceAddress>> searchedAddressList(String street) async {
    return _provider.getSearchedAddressList(street);
  }
}
