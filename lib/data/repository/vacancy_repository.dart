import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/vacancy_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VacancyRepository {
  final VacancyProvider _provider = VacancyProvider();
  Future<List<Vacancy>> publicVacancies([int page = 1]) async {
    return _provider.getPublicVacancies(
        const LatLng(37.560006, 58.456789), page,);
  }
}
