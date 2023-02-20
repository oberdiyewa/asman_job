import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/vacancy_provider.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

final VacancyProvider _provider = VacancyProvider();

class VacancyRepository {
  factory VacancyRepository() {
    return _vacancyRepository;
  }
  VacancyRepository._();

  static final VacancyRepository _vacancyRepository = VacancyRepository._();

  Future<List<Vacancy>> publicVacancies({required int page}) async {
    try {
      return _provider.getPublicVacancies(
        LatLng(37.560006, 58.456789),
        page,
      );
    } on DioError {
      rethrow;
    }
  }

  Future<VacancyDetail> vacancyDetail(int id) async {
    try {
      return _provider.getVacancyDetail(
        LatLng(37.560006, 58.456789),
        id,
      );
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
