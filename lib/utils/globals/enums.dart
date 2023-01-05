// ignore_for_file: constant_identifier_names

enum EnumStorageKeys {
  none,
  isDarkMode,
  userToken,
}

enum EnumAuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

enum EnumScreenName {
  home,
  search,
  notifs,
  profile,
}

enum EnumVacancyApiFields {
  id,
  title,
  employer_title,
  region,
  distance,
  avatar_url,
  point,
  created_at,
}

enum EnumVacancyDetailApiFields { address }

enum EnumProfileApiFields {
  name,
  surname,
  middle_name,
  gender,
  phone,
  birth_date,
  email,
  title,
  about_me,
  avatar_number,
  image,
}

enum EnumEducationApiFields {
  education_type_id,
  time,
  date_type,
  title,
  organization
}

enum EnumLanguageApiFields { code, level }

enum EnumExperienceApiFields {
  company_title,
  position,
  description,
  until_now,
  start,
  end,
}
