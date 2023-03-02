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
  chat,
  profile,
}

enum EnumPublicEntityApiFields {
  id,
  title,
  employer_title,
  fullname,
  region,
  distance,
  avatar_url,
  point,
  created_at,
  // belong to vacancy details
  description,
  emp_type,
  contact_phone,
  address,
  salary_from,
  salary_to,
  expiration_days,

  // belong to profile detail
  user_id,
  address_id,
  name,
  surname,
  middle_name,
  birth_date,
  gender,
  relocation,
  phone,
  email,
  about_me,
  avatar_number,
  status,
  status_trans,
  completeness,
  updated_at,
  deleted_at,
  specializations,
  experience,
  education,
  language,
}

enum EnumAddressApiFields {
  id,
  addressable_type,
  addressable_id,
  title,
  region,
  address_type,
  address,
  building,
  floor,
  door,
  point,
  description,
  meta,
  created_at,
  updated_at,
  deleted_at,
  coordinates,
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
  id,
  profile_id,
  education_type_id,
  time,
  date_type,
  title,
  organization,
  created_at,
  updated_at,
}

enum EnumLanguageApiFields {
  id,
  profile_id,
  code,
  level,
  created_at,
  updated_at,
}

enum EnumExperienceApiFields {
  id,
  profile_id,
  company_title,
  company_id,
  position,
  start,
  end,
  until_now,
  description,
  created_at,
  updated_at,
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

enum EnumUserCatalogueQueries {
  industry,
  employment_type,
  language,
  education_type,
  specializations,
  profile_avatars,
  vacancy_avatars
}
