import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/public_vacancy_provider.dart';
import 'package:latlong2/latlong.dart';

final PublicVacancyProvider _provider = PublicVacancyProvider();

class PublicVacancyRepository {
  factory PublicVacancyRepository() {
    return _publicVacancyRepository;
  }
  PublicVacancyRepository._();

  static final PublicVacancyRepository _publicVacancyRepository =
      PublicVacancyRepository._();

  int totalPage = 1;
  int searchPage = 1;

  Future<List<PublicEntity>> publicVacancies({
    required int page,
    String title = '',
    bool forSearch = false,
  }) async {
    return _provider.getPublicVacancies(
      LatLng(37.560006, 58.456789),
      page,
      title: title,
      forSearch: forSearch,
    );
  }

  Future<PublicVacancyDetail> vacancyDetail(int id) async {
    return _provider.getVacancyDetail(
      LatLng(37.560006, 58.456789),
      id,
    );
  }
}
