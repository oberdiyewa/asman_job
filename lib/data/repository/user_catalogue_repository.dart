import 'package:asman_work/data/model/user_catalogue/user_catalogue.dart';
import 'package:asman_work/data/providers/remote/user_catalogue_provider.dart';

final UserCatalogueProvider _provider = UserCatalogueProvider();

class UserCatalogueRepository {
  Future<UserCatalogue> userCatalogue() async {
    return _provider.fetchUserCatalogue();
  }
}
