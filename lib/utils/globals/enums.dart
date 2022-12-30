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
  title,
  employer_title,
  contact_phone,
  emp_type,
  description,
  industry_id,
  salary_from,
  salary_to,
  expiration_days,
  avatar_number,
  image,
  // Address fields
  address,
  point,
}

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
