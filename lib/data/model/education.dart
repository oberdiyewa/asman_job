// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';

@immutable
class Education {
  final int educationTypeId;
  final int time;
  final String dateType;
  final String title;
  final String organization;
  const Education({
    required this.educationTypeId,
    required this.time,
    required this.dateType,
    required this.title,
    required this.organization,
  });

  Education copyWith({
    int? educationTypeId,
    int? time,
    String? dateType,
    String? title,
    String? organization,
  }) {
    return Education(
      educationTypeId: educationTypeId ?? this.educationTypeId,
      time: time ?? this.time,
      dateType: dateType ?? this.dateType,
      title: title ?? this.title,
      organization: organization ?? this.organization,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumEducationApiFields.education_type_id.name: educationTypeId,
      EnumEducationApiFields.time.name: time,
      EnumEducationApiFields.date_type.name: dateType,
      EnumEducationApiFields.title.name: title,
      EnumEducationApiFields.organization.name: organization,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      educationTypeId:
          map[EnumEducationApiFields.education_type_id.name] as int,
      time: map[EnumEducationApiFields.time.name] as int,
      dateType: map[EnumEducationApiFields.date_type.name] as String,
      title: map[EnumEducationApiFields.title.name] as String,
      organization: map[EnumEducationApiFields.organization.name] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(educationTypeId: $educationTypeId, time: $time, dateType: $dateType, title: $title, organization: $organization)';
  }

  @override
  bool operator ==(covariant Education other) {
    if (identical(this, other)) return true;

    return other.educationTypeId == educationTypeId &&
        other.time == time &&
        other.dateType == dateType &&
        other.title == title &&
        other.organization == organization;
  }

  @override
  int get hashCode {
    return educationTypeId.hashCode ^
        time.hashCode ^
        dateType.hashCode ^
        title.hashCode ^
        organization.hashCode;
  }
}
