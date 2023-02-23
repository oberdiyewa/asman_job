import 'package:asman_work/utils/globals/enums.dart';

const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmQxNDdjYTgzYmJiNGViMWUwOGExODgzNDdiOWVhYzhkNmE4ZTBiMjllNTcxMjRhZmRlOWZmMGNlYzcwN2JlNmE3ZGMwYWY0ZjhjZjIxOTMiLCJpYXQiOjE2NzIzOTU1OTguMjA2MDU5LCJuYmYiOjE2NzIzOTU1OTguMjA2MDYsImV4cCI6MTY3MzY5MTU5OC4yMDMxMzIsInN1YiI6IjE2Iiwic2NvcGVzIjpbIioiXX0.wYk7NMOfYS3XDVCNBJBaBe9Im7CbpQFqFnzPCga9MS9zZAXmeZR3sWNuTRsjYIaWmPFia8jKsO-nguV3BSpqAWAO5lTim33-EjQzqWk1pkmO0wyfsx164fRuPBaAzJ2TqnYwe2VxlQPFDPNJt8gznEF6Gl9bSS7T98xcUKv1KIFWDXV41C-2NX76oGMEJYWrurXEQ3P0ZRQS2umDq2Op8lbGAz3mzbft0ML9-UPgeoVAapelY_tqqqRIj1hc3UYAn3pISSlI1nptNx-hME72l_y71ak0RwRNJpm02UMSx4w90E_252I_49QSOygu_iHqZ_k4qqsk5ftTPNqj0CVMSN59iPT-hSLGNUZQ7TJ38jnNai3U7ifLYmwveYQXbUVnsKySTRoDcug5S-KrBys_K4jsgg6Ad69br1Goqu5EeZoWZkTfUcY-nJzb7QbbVPJJObeL8wLwMzXuj7NXNFW4qTHIsD_SyTP3Cdqlhm-MjH9yWoxweWUPwao7sdgy22ioxHj-7NEQOarbh_f9bd6XcqCfkYACY4IaUBkZsY6zoX6bDDmibtBpcvugBpRZjiBCmmT5j5MQPPUm52RbXGC6IwL-xUwCgM3ZbbSo0HeEJbb-V5Hy9STt96xhQn9xQ9eiCuYjHCheYedJQKJl2sGXEE7oTauWnE-s2tYjvxmTYOo';

class APIEndPoints {
  APIEndPoints._();
  // static const String baseUrlUser = 'https://apingweb.com';
  static const String baseUrlPosts = 'hhttps://jsonplaceholder.typicode.com';
  static const String loginUserPost = '/api/login';
  static const String notesGet = '/posts';

  static const String kBaseUrl = 'https://itop-api.asmanexpress.com';
  static const String kApiPath = '/api';

  // Service's paths
  static const String kGoogleAddressreverse =
      '$kApiPath/services/google/address/reverse'; // Nominatim
  static const String kGoogleAddressSearch =
      '$kApiPath/services/google/address/search'; // Nominatim address lookup
  static const String kAddressreverse =
      '$kApiPath/services/address/reverse'; // Nominatim
  static const String kAddressSearch =
      '$kApiPath/services/address/search'; // Nominatim address lookup

  // Catalogue
  static const String kUserCataloguePath =
      '$kApiPath/users/catalogue'; // Shows catalogue information

  // User's Profile
  static const String kUserProfilePath = '$kApiPath/users/profile';
  static String kUserProfilePathWithId(int id, {bool needDetails = false}) =>
      needDetails
          ? '$kUserProfilePath/details/$id'
          : '$kUserProfilePath/$id'; // Fetch, delete or edit profile by id
  static const kUserProfileListPath = '$kUserProfilePath/list'; // Profile list

  // Profile search
  static const kUserProfileSearchPath =
      '$kApiPath/users/search/profile'; // Profile search

  // User address
  static String kUserProfileAddressPath(int profileId, {int? id}) => id == null
      ? '$kUserProfilePath/$profileId/${EnumUserProfilePaths.address.name}'
      : '$kUserProfilePath/$profileId/${EnumUserProfilePaths.address.name}/$id'; // Add, fetch, delete, edit profile address

  // User education
  static String kUserProfileEducationPath(
    int profileId, {
    int? id,
  }) =>
      id == null
          ? '$kUserProfilePath/$profileId/${EnumUserProfilePaths.education.name}'
          : '$kUserProfilePath/$profileId/${EnumUserProfilePaths.education.name}/$id'; // Add, fetch, delete, edit profile education

  static String kUserProfileEducationList(int profileId) =>
      '$kUserProfilePath/$profileId/${EnumUserProfilePaths.education.name}/list'; // Education list by profile id

  // User experience
  static String kUserProfileExperiencePath(
    int profileId, {
    int? id,
  }) =>
      id == null
          ? '$kUserProfilePath/$profileId/${EnumUserProfilePaths.experience.name}'
          : '$kUserProfilePath/$profileId/${EnumUserProfilePaths.experience.name}/$id'; // Add, fetch, delete, edit profile experience

  static String kUserProfileExperienceList(int profileId) =>
      '$kUserProfilePath/$profileId/${EnumUserProfilePaths.experience.name}/list'; // Experience list by profile id

  // User Language
  static String kUserProfileLanguagePath(
    int profileId, {
    int? id,
  }) =>
      id == null
          ? '$kUserProfilePath/$profileId/${EnumUserProfilePaths.language.name}'
          : '$kUserProfilePath/$profileId/${EnumUserProfilePaths.language.name}/$id'; // Add, fetch, delete, edit profile language

  static String kUserProfileLanguageList(int profileId) =>
      '$kUserProfilePath/$profileId/${EnumUserProfilePaths.language.name}/list'; // Language list by profile id

  // User state
  static const String kUsersStatePath = '$kApiPath/users/state';

  // Vacancy
  static String kUsersVacancyPath(EnumUserVacancyPaths path, [int? id]) {
    switch (path) {
      case EnumUserVacancyPaths.address:
        return '$kApiPath/users/vacancy/$id/${path.name}';
      case EnumUserVacancyPaths.details:
        return '$kApiPath/users/vacancy/${path.name}/$id';
      case EnumUserVacancyPaths.list:
      case EnumUserVacancyPaths.search:
        return '$kApiPath/users/${path.name}/vacancy';
      // ignore: no_default_cases
      default:
        return id == null
            ? '$kApiPath/users/vacancy'
            : '$kApiPath/users/vacancy/$id';
    }
  }
}
