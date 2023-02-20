// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';

import 'package:flutter/material.dart';

@immutable
class Experience {
  final String companyTitle;
  final String position;
  final String? description;
  final bool? untilNow;
  final String start;
  final String? end;
  const Experience({
    required this.companyTitle,
    required this.position,
    required this.start,
    this.description,
    this.untilNow,
    this.end,
  });

  Experience copyWith({
    String? companyTitle,
    String? position,
    String? description,
    bool? untilNow,
    String? start,
    String? end,
  }) {
    return Experience(
      companyTitle: companyTitle ?? this.companyTitle,
      position: position ?? this.position,
      description: description ?? this.description,
      untilNow: untilNow ?? this.untilNow,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumExperienceApiFields.company_title.name: companyTitle,
      EnumExperienceApiFields.position.name: position,
      EnumExperienceApiFields.description.name: description,
      EnumExperienceApiFields.until_now.name: untilNow,
      EnumExperienceApiFields.start.name: start,
      EnumExperienceApiFields.end.name: end,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      companyTitle: map[EnumExperienceApiFields.company_title.name] as String,
      position: map[EnumExperienceApiFields.position.name] as String,
      description: map[EnumExperienceApiFields.description.name] != null
          ? map[EnumExperienceApiFields.description.name] as String
          : null,
      untilNow: map[EnumExperienceApiFields.until_now.name] != null
          ? map[EnumExperienceApiFields.until_now.name] as bool
          : null,
      start: map[EnumExperienceApiFields.start.name] as String,
      end: map[EnumExperienceApiFields.end.name] != null
          ? map[EnumExperienceApiFields.end.name] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Experience.fromJson(String source) =>
      Experience.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Experience(companyTitle: $companyTitle, position: $position, description: $description, untilNow: $untilNow, start: $start, end: $end)';
  }

  @override
  bool operator ==(covariant Experience other) {
    if (identical(this, other)) return true;

    return other.companyTitle == companyTitle &&
        other.position == position &&
        other.description == description &&
        other.untilNow == untilNow &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    return companyTitle.hashCode ^
        position.hashCode ^
        description.hashCode ^
        untilNow.hashCode ^
        start.hashCode ^
        end.hashCode;
  }
}
