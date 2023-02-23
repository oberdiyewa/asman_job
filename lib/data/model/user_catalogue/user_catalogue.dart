// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserCatalogue {
  final List<CatalogueIndustry>? industry;
  final List<CatalogueEmploymentType>? employmentType;
  final List<CatalogueLanguage>? language;
  final List<CatalogueEducationType>? educationType;
  const UserCatalogue({
    this.industry,
    this.employmentType,
    this.language,
    this.educationType,
  });

  UserCatalogue copyWith({
    List<CatalogueIndustry>? industry,
    List<CatalogueEmploymentType>? employmentType,
    List<CatalogueLanguage>? language,
    List<CatalogueEducationType>? educationType,
  }) {
    return UserCatalogue(
      industry: industry ?? this.industry,
      employmentType: employmentType ?? this.employmentType,
      language: language ?? this.language,
      educationType: educationType ?? this.educationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'industry': industry?.map((x) => x.toMap()).toList() ?? [],
      'employment_type': employmentType?.map((x) => x.toMap()).toList() ?? [],
      'language': language?.map((x) => x.toMap()).toList() ?? [],
      'education_type': educationType?.map((x) => x.toMap()).toList() ?? [],
    };
  }

  factory UserCatalogue.fromMap(Map<String, dynamic> map) {
    return UserCatalogue(
      industry: map['industry'] != null
          ? List<CatalogueIndustry>.from(
              (map['industry'] as List).map<CatalogueIndustry?>(
                (x) => CatalogueIndustry.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      employmentType: map['employment_type'] != null
          ? List<CatalogueEmploymentType>.from(
              (map['employment_type'] as List).map<CatalogueEmploymentType?>(
                (x) =>
                    CatalogueEmploymentType.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      language: map['language'] != null
          ? List<CatalogueLanguage>.from(
              (map['language'] as List).map<CatalogueLanguage?>(
                (x) => CatalogueLanguage.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      educationType: map['education_type'] != null
          ? List<CatalogueEducationType>.from(
              (map['education_type'] as List).map<CatalogueEducationType?>(
                (x) =>
                    CatalogueEducationType.fromMap(x as Map<String, dynamic>),
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
    return 'UserCatalogue(industry: $industry, employmentType: $employmentType, language: $language, educationType: $educationType)';
  }

  @override
  bool operator ==(covariant UserCatalogue other) {
    if (identical(this, other)) return true;

    return listEquals(other.industry, industry) &&
        listEquals(other.employmentType, employmentType) &&
        listEquals(other.language, language) &&
        listEquals(other.educationType, educationType);
  }

  @override
  int get hashCode {
    return industry.hashCode ^
        employmentType.hashCode ^
        language.hashCode ^
        educationType.hashCode;
  }
}

// Industry
@immutable
class CatalogueIndustry {
  final String title;
  final int code;

  const CatalogueIndustry(
    this.title,
    this.code,
  );

  CatalogueIndustry copyWith({
    String? title,
    int? code,
  }) {
    return CatalogueIndustry(
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

  factory CatalogueIndustry.fromMap(Map<String, dynamic> map) {
    return CatalogueIndustry(
      map['title'] as String,
      map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueIndustry.fromJson(String source) =>
      CatalogueIndustry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogueIndustry(title: $title, code: $code)';

  @override
  bool operator ==(covariant CatalogueIndustry other) {
    if (identical(this, other)) return true;

    return other.title == title && other.code == code;
  }

  @override
  int get hashCode => title.hashCode ^ code.hashCode;
}

// Employment type
@immutable
class CatalogueEmploymentType {
  final String title;
  final String code;

  const CatalogueEmploymentType(
    this.title,
    this.code,
  );

  CatalogueEmploymentType copyWith({
    String? title,
    String? code,
  }) {
    return CatalogueEmploymentType(
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

  factory CatalogueEmploymentType.fromMap(Map<String, dynamic> map) {
    return CatalogueEmploymentType(
      map['title'] as String,
      map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueEmploymentType.fromJson(String source) =>
      CatalogueEmploymentType.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogueEmploymentType(title: $title, code: $code)';

  @override
  bool operator ==(covariant CatalogueEmploymentType other) {
    if (identical(this, other)) return true;

    return other.title == title && other.code == code;
  }

  @override
  int get hashCode => title.hashCode ^ code.hashCode;
}

// Language
@immutable
class CatalogueLanguage {
  final String title;
  final String code;

  const CatalogueLanguage(
    this.title,
    this.code,
  );

  CatalogueLanguage copyWith({
    String? title,
    String? code,
  }) {
    return CatalogueLanguage(
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

  factory CatalogueLanguage.fromMap(Map<String, dynamic> map) {
    return CatalogueLanguage(
      map['title'] as String,
      map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueLanguage.fromJson(String source) =>
      CatalogueLanguage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogueLanguage(title: $title, code: $code)';

  @override
  bool operator ==(covariant CatalogueLanguage other) {
    if (identical(this, other)) return true;

    return other.title == title && other.code == code;
  }

  @override
  int get hashCode => title.hashCode ^ code.hashCode;
}

// Education type
@immutable
class CatalogueEducationType {
  final String title;
  final String code;

  const CatalogueEducationType(
    this.title,
    this.code,
  );

  CatalogueEducationType copyWith({
    String? title,
    String? code,
  }) {
    return CatalogueEducationType(
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

  factory CatalogueEducationType.fromMap(Map<String, dynamic> map) {
    return CatalogueEducationType(
      map['title'] as String,
      map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogueEducationType.fromJson(String source) =>
      CatalogueEducationType.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatalogueEducationType(title: $title, code: $code)';

  @override
  bool operator ==(covariant CatalogueEducationType other) {
    if (identical(this, other)) return true;

    return other.title == title && other.code == code;
  }

  @override
  int get hashCode => title.hashCode ^ code.hashCode;
}


class CatalogueVacancyAvatar{}