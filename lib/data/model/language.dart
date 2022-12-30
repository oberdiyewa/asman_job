// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';

@immutable
class Language {
  final String code;
  final int level;
  const Language({
    required this.code,
    required this.level,
  });

  Language copyWith({
    String? code,
    int? level,
  }) {
    return Language(
      code: code ?? this.code,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumLanguageApiFields.code.name: code,
      EnumLanguageApiFields.level.name: level,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      code: map[EnumLanguageApiFields.code.name] as String,
      level: map[EnumLanguageApiFields.level.name] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Language(code: $code, level: $level)';

  @override
  bool operator ==(covariant Language other) {
    if (identical(this, other)) return true;

    return other.code == code && other.level == level;
  }

  @override
  int get hashCode => code.hashCode ^ level.hashCode;
}
