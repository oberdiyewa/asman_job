import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/user_vacancy_provider.dart';

final UserVacancyProvider _provider = UserVacancyProvider();

class UserVacancyRepository {
  factory UserVacancyRepository() {
    return _userVacancyRepository;
  }
  UserVacancyRepository._();

  static final UserVacancyRepository _userVacancyRepository =
      UserVacancyRepository._();

  int userVacancyTotalPage = 0;

  Future<List<UserVacancy>> userVacancyList({required int page}) async {
    return _provider.getUserVacancyList(
      page,
    );
  }

  Future<UserVacancy> userVacancy(int id) async {
    return _provider.getUserVacancy(id);
  }

  Future<bool> userVacancyAdd(Map<String, dynamic> data) async {
    return _provider.addUserVacancy(data);
  }

  Future<bool> userVacancyUpdate(Map<String, dynamic> data, int id) async {
    return _provider.updateUserVacancy(data, id);
  }

  Future<bool> userVacancyDelete(int id) async {
    return _provider.deleteUserVacancy(id);
  }
}
