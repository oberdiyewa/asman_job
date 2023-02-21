// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';

@immutable
class Education {
  final int id;
  final int profileId;
  final int educationTypeId;
  final String dateType;
  final int time;
  final String organization;
  final String title;
  final String createdAt;
  final String? updatedAt;

  const Education({
    required this.id,
    required this.profileId,
    required this.educationTypeId,
    required this.dateType,
    required this.time,
    required this.organization,
    required this.title,
    required this.createdAt,
    this.updatedAt,
  });

  Education copyWith({
    int? id,
    int? profileId,
    int? educationTypeId,
    String? dateType,
    int? time,
    String? organization,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) {
    return Education(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      educationTypeId: educationTypeId ?? this.educationTypeId,
      dateType: dateType ?? this.dateType,
      time: time ?? this.time,
      organization: organization ?? this.organization,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // EnumEducationApiFields.created_at.name: createdAt,
      // EnumEducationApiFields.updated_at.name: updatedAt,
      // EnumEducationApiFields.id.name: id,
      // EnumEducationApiFields.profile_id.name: profileId,
      EnumEducationApiFields.organization.name: organization,
      EnumEducationApiFields.education_type_id.name: educationTypeId,
      EnumEducationApiFields.time.name: time,
      EnumEducationApiFields.date_type.name: dateType,
      EnumEducationApiFields.title.name: title,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map[EnumEducationApiFields.id.name] as int,
      profileId: map[EnumEducationApiFields.profile_id.name] as int,
      educationTypeId:
          map[EnumEducationApiFields.education_type_id.name] as int,
      dateType: map[EnumEducationApiFields.date_type.name] as String,
      time: map[EnumEducationApiFields.time.name] as int,
      organization: map[EnumEducationApiFields.organization.name] as String,
      title: map[EnumEducationApiFields.title.name] as String,
      createdAt: map[EnumEducationApiFields.created_at.name] as String,
      updatedAt: map[EnumEducationApiFields.updated_at.name] != null
          ? map[EnumEducationApiFields.updated_at.name] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(id: $id, profileId: $profileId, educationTypeId: $educationTypeId, dateType: $dateType, time: $time, organization: $organization, title: $title, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Education other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.profileId == profileId &&
        other.educationTypeId == educationTypeId &&
        other.dateType == dateType &&
        other.time == time &&
        other.organization == organization &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        profileId.hashCode ^
        educationTypeId.hashCode ^
        dateType.hashCode ^
        time.hashCode ^
        organization.hashCode ^
        title.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
