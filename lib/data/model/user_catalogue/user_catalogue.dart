// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserCatalogue {
  final List<CatalogueType>? industry;
  final List<CatalogueType>? employmentType;
  final List<CatalogueType>? language;
  final List<CatalogueType>? educationType;
  final List<CatalogueAvatars>? profileAvatars;
  final List<CatalogueAvatars>? vacancyAvatars;
  const UserCatalogue({
    this.industry,
    this.employmentType,
    this.language,
    this.educationType,
    this.profileAvatars,
    this.vacancyAvatars,
  });

  UserCatalogue copyWith({
    List<CatalogueType>? industry,
    List<CatalogueType>? employmentType,
    List<CatalogueType>? language,
    List<CatalogueType>? educationType,
    List<CatalogueAvatars>? profileAvatars,
    List<CatalogueAvatars>? vacancyAvatars,
  }) {
    return UserCatalogue(
      industry: industry ?? this.industry,
      employmentType: employmentType ?? this.employmentType,
      language: language ?? this.language,
      educationType: educationType ?? this.educationType,
      profileAvatars: profileAvatars ?? this.profileAvatars,
      vacancyAvatars: vacancyAvatars ?? this.vacancyAvatars,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'industry': industry?.map((x) => x.toMap()).toList() ?? [],
      'employment_type': employmentType?.map((x) => x.toMap()).toList() ?? [],
      'language': language?.map((x) => x.toMap()).toList() ?? [],
      'education_type': educationType?.map((x) => x.toMap()).toList() ?? [],
      'profile_avatars': profileAvatars?.map((x) => x.toMap()).toList() ?? [],
      'vacancy_avatars': vacancyAvatars?.map((x) => x.toMap()).toList() ?? [],
    };
  }

  factory UserCatalogue.fromMap(Map<String, dynamic> map) {
    return UserCatalogue(
      industry: map['industry'] != null
          ? List<CatalogueType>.from(
              (map['industry'] as List).map<CatalogueType?>(
                (x) => CatalogueType.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      employmentType: map['employment_type'] != null
          ? List<CatalogueType>.from(
              (map['employment_type'] as List).map<CatalogueType?>(
                (x) => CatalogueType.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      language: map['language'] != null
          ? List<CatalogueType>.from(
              (map['language'] as List).map<CatalogueType?>(
                (x) => CatalogueType.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      educationType: map['education_type'] != null
          ? List<CatalogueType>.from(
              (map['education_type'] as List).map<CatalogueType?>(
                (x) => CatalogueType.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      profileAvatars: map['profile_avatars'] != null
          ? List<CatalogueAvatars>.from(
              (map['profile_avatars'] as List).map<CatalogueAvatars?>(
                (x) => CatalogueAvatars.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      vacancyAvatars: map['vacancy_avatars'] != null
          ? List<CatalogueAvatars>.from(
              (map['vacancy_avatars'] as List).map<CatalogueAvatars?>(
                (x) => CatalogueAvatars.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCatalogue.fromJson(String source) =>
      UserCatalogue.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''
    UserCatalogue(
      industry: $industry, 
      employmentType: $employmentType, 
      language: $language, 
      educationType: $educationType, 
      profileAvatars; $profileAvatars, 
      vacancyAvatars: $vacancyAvatars,
      )
    ''';
  }

  @override
  bool operator ==(covariant UserCatalogue other) {
    if (identical(this, other)) return true;

    return listEquals(other.industry, industry) &&
        listEquals(other.employmentType, employmentType) &&
        listEquals(other.language, language) &&
        listEquals(other.educationType, educationType) &&
        listEquals(other.profileAvatars, profileAvatars) &&
        listEquals(vacancyAvatars, vacancyAvatars);
  }

  @override
  int get hashCode {
    return industry.hashCode ^
        employmentType.hashCode ^
        language.hashCode ^
        educationType.hashCode ^
        profileAvatars.hashCode ^
        vacancyAvatars.hashCode;
  }
}

// Industry
@immutable
class CatalogueType {
  final String title;
  final String code;

  const CatalogueType(
    this.title,
    this.code,
  );

  CatalogueType copyWith({
    String? title,
    String? code,
  }) {
    return CatalogueType(
      title ?? this.title,
      code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'code': code,
    };
  }

  factory CatalogueType.fromMap(Map<String, dynamic> map) {
    return CatalogueType(
      map['title'] as String,
      map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueType.fromJson(String source) =>
      CatalogueType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogueIndustry(title: $title, code: $code)';

  @override
  bool operator ==(covariant CatalogueType other) {
    if (identical(this, other)) return true;

    return other.title == title && other.code == code;
  }

  @override
  int get hashCode => title.hashCode ^ code.hashCode;
}

@immutable
class CatalogueAvatars {
  final int number;
  final String avatarUrl;
  const CatalogueAvatars({
    required this.number,
    required this.avatarUrl,
  });

  CatalogueAvatars copyWith({
    int? number,
    String? avatarUrl,
  }) {
    return CatalogueAvatars(
      number: number ?? this.number,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'avatar_url': avatarUrl,
    };
  }

  factory CatalogueAvatars.fromMap(Map<String, dynamic> map) {
    return CatalogueAvatars(
      number: map['number'] as int,
      avatarUrl: map['avatar_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueAvatars.fromJson(String source) =>
      CatalogueAvatars.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CatalogueAvatars(number: $number, avatarUrl: $avatarUrl)';

  @override
  bool operator ==(covariant CatalogueAvatars other) {
    if (identical(this, other)) return true;

    return other.number == number && other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode => number.hashCode ^ avatarUrl.hashCode;
}
