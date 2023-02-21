// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';

@immutable
class Experience {
  final int id;
  final int profileid;
  final String companyTitle;
  final int? companyid;
  final String position;
  final String start;
  final String? end;
  final bool? untilNow;
  final String? description;
  final String createdAt;
  final String? updatedAt;

  const Experience({
    required this.id,
    required this.profileid,
    required this.companyTitle,
    required this.position,
    required this.start,
    required this.createdAt,
    this.companyid,
    this.end,
    this.untilNow,
    this.description,
    this.updatedAt,
  });

  Experience copyWith({
    int? id,
    int? profileid,
    String? companyTitle,
    int? companyid,
    String? position,
    String? start,
    String? end,
    bool? untilNow,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return Experience(
      id: id ?? this.id,
      profileid: profileid ?? this.profileid,
      companyTitle: companyTitle ?? this.companyTitle,
      companyid: companyid ?? this.companyid,
      position: position ?? this.position,
      start: start ?? this.start,
      end: end ?? this.end,
      untilNow: untilNow ?? this.untilNow,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // EnumExperienceApiFields.id.name: id,
      // EnumExperienceApiFields.profile_id.name: profileid,
      // EnumExperienceApiFields.company_id.name: companyid,
      // EnumExperienceApiFields.created_at.name: createdAt,
      // EnumExperienceApiFields.updated_at.name: updatedAt,
      EnumExperienceApiFields.company_title.name: companyTitle,
      EnumExperienceApiFields.position.name: position,
      EnumExperienceApiFields.start.name: start,
      EnumExperienceApiFields.end.name: end,
      EnumExperienceApiFields.until_now.name: untilNow,
      EnumExperienceApiFields.description.name: description,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map[EnumExperienceApiFields.id.name] as int,
      profileid: map[EnumExperienceApiFields.profile_id.name] as int,
      companyTitle: map[EnumExperienceApiFields.company_title.name] as String,
      companyid: map[EnumExperienceApiFields.company_id.name] != null ? map[EnumExperienceApiFields.company_id.name] as int : null,
      position: map[EnumExperienceApiFields.position.name] as String,
      start: map[EnumExperienceApiFields.start.name] as String,
      end: map[EnumExperienceApiFields.end.name] != null ? map[EnumExperienceApiFields.end.name] as String : null,
      untilNow: map[EnumExperienceApiFields.until_now.name] != null ? map[EnumExperienceApiFields.until_now.name] as bool : null,
      description: map[EnumExperienceApiFields.description.name] != null ? map[EnumExperienceApiFields.description.name] as String : null,
      createdAt: map[EnumExperienceApiFields.created_at.name] as String,
      updatedAt: map[EnumExperienceApiFields.updated_at.name] != null ? map[EnumExperienceApiFields.updated_at.name] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Experience.fromJson(String source) => Experience.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Experience(id: $id, profileid: $profileid, companyTitle: $companyTitle, companyid: $companyid, position: $position, start: $start, end: $end, untilNow: $untilNow, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Experience other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.profileid == profileid &&
      other.companyTitle == companyTitle &&
      other.companyid == companyid &&
      other.position == position &&
      other.start == start &&
      other.end == end &&
      other.untilNow == untilNow &&
      other.description == description &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      profileid.hashCode ^
      companyTitle.hashCode ^
      companyid.hashCode ^
      position.hashCode ^
      start.hashCode ^
      end.hashCode ^
      untilNow.hashCode ^
      description.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
