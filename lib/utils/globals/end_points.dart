class APIEndPoints {
  APIEndPoints._();
  static const String baseUrlUser = 'https://apingweb.com';
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

  // User's paths
  static const String kUserCataloguePath =
      '$kApiPath/users/catalogue'; // Shows catalogue information
  static const String kUserProfilePath = '$kApiPath/users/profile';
  static String kUserProfilePathWithId(int id, {bool needDetails = false}) =>
      needDetails
          ? '$kUserProfilePath/$id'
          : '$kUserProfilePath/details/$id'; // Fetch, delete or edit profile by id
  static const kUserProfileListPath = '$kUserProfilePath/list'; // Profile list
  static const kUserProfileSearchPath =
      '$kUserProfilePath/search'; // Profile search

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
  static String kUsersVacancyPath(EnumUserVacancyPaths path, [int? id]) {
    switch (path) {
      case EnumUserVacancyPaths.address:
        return '$kApiPath/users/vacancy/$id/${path.name}';
      case EnumUserVacancyPaths.details:
        return '$kApiPath/users/vacancy/${path.name}/$id';
      case EnumUserVacancyPaths.list:
      case EnumUserVacancyPaths.search:
        return '/users/vacancy/${path.name}';
      // ignore: no_default_cases
      default:
        return id == null
            ? '$kApiPath/users/vacancy'
            : '$kApiPath/users/vacancy/$id';
    }
  }
}

enum EnumUserProfilePaths {
  address,
  education,
  experience,
  language,
}

enum EnumUserVacancyPaths {
  address,
  details,
  list,
  none,
  search,
}
