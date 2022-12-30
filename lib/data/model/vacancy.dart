// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';

@immutable
class Vacancy {
  final String title;
  final String employerTitle;
  final List<String> contactPhone;
  final String empType;
  final String? description;
  final int industryId;
  final int? salaryFrom;
  final int? salaryTo;
  final int expirationDays;
  final int? avatarNumber;
  final String? image;
  const Vacancy({
    required this.title,
    required this.employerTitle,
    required this.contactPhone,
    required this.empType,
    this.description,
    required this.industryId,
    this.salaryFrom,
    this.salaryTo,
    required this.expirationDays,
    this.avatarNumber,
    this.image,
  });

  Vacancy copyWith({
    String? title,
    String? employerTitle,
    List<String>? contactPhone,
    String? empType,
    String? description,
    int? industryId,
    int? salaryFrom,
    int? salaryTo,
    int? expirationDays,
    int? avatarNumber,
    String? image,
  }) {
    return Vacancy(
      title: title ?? this.title,
      employerTitle: employerTitle ?? this.employerTitle,
      contactPhone: contactPhone ?? this.contactPhone,
      empType: empType ?? this.empType,
      description: description ?? this.description,
      industryId: industryId ?? this.industryId,
      salaryFrom: salaryFrom ?? this.salaryFrom,
      salaryTo: salaryTo ?? this.salaryTo,
      expirationDays: expirationDays ?? this.expirationDays,
      avatarNumber: avatarNumber ?? this.avatarNumber,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumVacancyApiFields.title.name: title,
      EnumVacancyApiFields.employer_title.name: employerTitle,
      EnumVacancyApiFields.contact_phone.name: contactPhone,
      EnumVacancyApiFields.emp_type.name: empType,
      EnumVacancyApiFields.description.name: description,
      EnumVacancyApiFields.industry_id.name: industryId,
      EnumVacancyApiFields.salary_from.name: salaryFrom,
      EnumVacancyApiFields.salary_to.name: salaryTo,
      EnumVacancyApiFields.expiration_days.name: expirationDays,
      EnumVacancyApiFields.avatar_number.name: avatarNumber,
      EnumVacancyApiFields.image.name: image,
    };
  }

  factory Vacancy.fromMap(Map<String, dynamic> map) {
    return Vacancy(
      title: map[EnumVacancyApiFields.title.name] as String,
      employerTitle: map[EnumVacancyApiFields.employer_title.name] as String,
      contactPhone: List<String>.from(
        map[EnumVacancyApiFields.contact_phone.name] as List<String>,
      ),
      empType: map[EnumVacancyApiFields.emp_type.name] as String,
      description: map[EnumVacancyApiFields.description.name] != null
          ? map[EnumVacancyApiFields.description.name] as String
          : null,
      industryId: map[EnumVacancyApiFields.industry_id.name] as int,
      salaryFrom: map[EnumVacancyApiFields.salary_from.name] != null
          ? map[EnumVacancyApiFields.salary_from.name] as int
          : null,
      salaryTo: map[EnumVacancyApiFields.salary_to.name] != null
          ? map[EnumVacancyApiFields.salary_to.name] as int
          : null,
      expirationDays: map[EnumVacancyApiFields.expiration_days.name] as int,
      avatarNumber: map[EnumVacancyApiFields.avatar_number.name] != null
          ? map[EnumVacancyApiFields.avatar_number.name] as int
          : null,
      image: map[EnumVacancyApiFields.image.name] != null
          ? map[EnumVacancyApiFields.image.name] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vacancy.fromJson(String source) =>
      Vacancy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Vacancy(title: $title, employerTitle: $employerTitle, contactPhone: $contactPhone, empType: $empType, descripiton: $description, industryId: $industryId, salaryFrom: $salaryFrom, salaryTo: $salaryTo, expirationDays: $expirationDays, avatarNumber: $avatarNumber, image: $image)';
  }

  @override
  bool operator ==(covariant Vacancy other) {
    if (identical(this, other)) return true;
    return other.title == title &&
        other.employerTitle == employerTitle &&
        listEquals(other.contactPhone, contactPhone) &&
        other.empType == empType &&
        other.description == description &&
        other.industryId == industryId &&
        other.salaryFrom == salaryFrom &&
        other.salaryTo == salaryTo &&
        other.expirationDays == expirationDays &&
        other.avatarNumber == avatarNumber &&
        other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        employerTitle.hashCode ^
        contactPhone.hashCode ^
        empType.hashCode ^
        description.hashCode ^
        industryId.hashCode ^
        salaryFrom.hashCode ^
        salaryTo.hashCode ^
        expirationDays.hashCode ^
        avatarNumber.hashCode ^
        image.hashCode;
  }
}
