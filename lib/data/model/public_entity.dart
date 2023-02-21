// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

@immutable
class PublicEntity {
  final int id;
  final String title;
  final String? employerTitle;
  final String? fullname;
  final String region;
  final String distance;
  final String avatarUrl;
  final LatLng point;
  final String createdAt;

  const PublicEntity({
    required this.id,
    required this.title,
    required this.region,
    required this.distance,
    required this.avatarUrl,
    required this.point,
    required this.createdAt,
    this.employerTitle,
    this.fullname,
  });

  PublicEntity copyWith({
    int? id,
    String? title,
    String? region,
    String? employerTitle,
    String? fullname,
    String? distance,
    String? avatarUrl,
    LatLng? point,
    String? createdAt,
  }) {
    return PublicEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      employerTitle: employerTitle ?? this.employerTitle,
      fullname: fullname ?? this.fullname,
      region: region ?? this.region,
      distance: distance ?? this.distance,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      point: point ?? this.point,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumPublicEntityApiFields.id.name: id,
      EnumPublicEntityApiFields.title.name: title,
      EnumPublicEntityApiFields.employer_title.name: employerTitle,
      EnumPublicEntityApiFields.fullname.name: fullname,
      EnumPublicEntityApiFields.region.name: region,
      EnumPublicEntityApiFields.distance.name: distance,
      EnumPublicEntityApiFields.avatar_url.name: avatarUrl,
      EnumPublicEntityApiFields.point.name: [point.latitude, point.longitude],
      EnumPublicEntityApiFields.created_at.name: createdAt,
    };
  }

  factory PublicEntity.fromMap(Map<String, dynamic> map) {
    final point =
        List<double>.from(map[EnumPublicEntityApiFields.point.name] as List);
    return PublicEntity(
      id: map[EnumPublicEntityApiFields.id.name] as int,
      title: map[EnumPublicEntityApiFields.title.name] as String,
      employerTitle: map[EnumPublicEntityApiFields.employer_title.name] != null
          ? map[EnumPublicEntityApiFields.employer_title.name] as String
          : null,
      fullname: map[EnumPublicEntityApiFields.fullname.name] != null
          ? map[EnumPublicEntityApiFields.fullname.name] as String
          : null,
      region: map[EnumPublicEntityApiFields.region.name] as String,
      distance: map[EnumPublicEntityApiFields.distance.name] as String,
      avatarUrl: map[EnumPublicEntityApiFields.avatar_url.name] as String,
      point: LatLng(point.first, point.last),
      createdAt: map[EnumPublicEntityApiFields.created_at.name] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicEntity.fromJson(String source) =>
      PublicEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicEntity(id: $id, title: $title, employerTitle: $employerTitle, fullname: $fullname, region: $region, distance: $distance, avatarUrl: $avatarUrl, point: $point, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant PublicEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.employerTitle == employerTitle &&
        other.fullname == fullname &&
        other.region == region &&
        other.distance == distance &&
        other.avatarUrl == avatarUrl &&
        other.point == point &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        employerTitle.hashCode ^
        fullname.hashCode ^
        region.hashCode ^
        distance.hashCode ^
        avatarUrl.hashCode ^
        point.hashCode ^
        createdAt.hashCode;
  }
}

// ======================    PublicVacancy Details    ======================
