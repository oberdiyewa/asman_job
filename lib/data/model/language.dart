// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';

@immutable
class Language {
  final int id;
  final int profileId;
  final String code;
  final int level;
  final String createdAt;
  final String? updatedAt;

  const Language({
    required this.id,
    required this.profileId,
    required this.code,
    required this.level,
    required this.createdAt,
    this.updatedAt,
  });

  Language copyWith({
    int? id,
    int? profileId,
    String? code,
    int? level,
    String? createdAt,
    String? updatedAt,
  }) {
    return Language(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      code: code ?? this.code,
      level: level ?? this.level,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // EnumLanguageApiFields.profile_id.name: profileId,
      // EnumLanguageApiFields.created_at.name: createdAt,
      // EnumLanguageApiFields.updated_at.name: updatedAt,
      EnumLanguageApiFields.code.name: code,
      EnumLanguageApiFields.level.name: level,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      id: map[EnumLanguageApiFields.id.name] as int,
      profileId: map[EnumLanguageApiFields.profile_id.name] as int,
      code: map[EnumLanguageApiFields.code.name] as String,
      level: map[EnumLanguageApiFields.level.name] as int,
      createdAt: map[EnumLanguageApiFields.created_at.name] as String,
      updatedAt: map[EnumLanguageApiFields.updated_at.name] != null ? map[EnumLanguageApiFields.updated_at.name] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) => Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Language(id: $id, profileId: $profileId, code: $code, level: $level, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Language other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.profileId == profileId &&
      other.code == code &&
      other.level == level &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      profileId.hashCode ^
      code.hashCode ^
      level.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
