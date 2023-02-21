// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

@immutable
class PublicVacancyDetail{
  final int id;
  final String title;
  final String employerTitle;
  final String region;
  final String distance;
  final String avatarUrl;
  final LatLng point;
  final String createdAt;
  final String description;
  final String? employmentType;
  final List<String> contactPhone;
  final String address;
  final int salaryFrom;
  final int salaryTo;
  const PublicVacancyDetail({
    required this.id,
    required this.title,
    required this.employerTitle,
    required this.region,
    required this.distance,
    required this.avatarUrl,
    required this.point,
    required this.createdAt,
    required this.description,
    required this.contactPhone,
    required this.address,
    required this.salaryFrom,
    required this.salaryTo,
    this.employmentType,
  });

  PublicVacancyDetail copyWith({
    int? id,
    String? title,
    String? employerTitle,
    String? region,
    String? distance,
    String? avatarUrl,
    LatLng? point,
    String? createdAt,
    String? description,
    String? employmentType,
    List<String>? contactPhone,
    String? address,
    int? salaryFrom,
    int? salaryTo,
  }) {
    return PublicVacancyDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      employerTitle: employerTitle ?? this.employerTitle,
      region: region ?? this.region,
      distance: distance ?? this.distance,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      point: point ?? this.point,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      employmentType: employmentType ?? this.employmentType,
      contactPhone: contactPhone ?? this.contactPhone,
      address: address ?? this.address,
      salaryFrom: salaryFrom ?? this.salaryFrom,
      salaryTo: salaryTo ?? this.salaryTo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumPublicEntityApiFields.id.name: id,
      EnumPublicEntityApiFields.title.name: title,
      EnumPublicEntityApiFields.employer_title.name: employerTitle,
      EnumPublicEntityApiFields.region.name: region,
      EnumPublicEntityApiFields.distance.name: distance,
      EnumPublicEntityApiFields.avatar_url.name: avatarUrl,
      EnumPublicEntityApiFields.point.name: [point.latitude, point.longitude],
      EnumPublicEntityApiFields.created_at.name: createdAt,
      EnumPublicEntityApiFields.description.name: description,
      EnumPublicEntityApiFields.employment_type.name: employmentType,
      EnumPublicEntityApiFields.contact_phone.name: contactPhone,
      EnumPublicEntityApiFields.address.name: address,
      EnumPublicEntityApiFields.salary_from.name: salaryFrom,
      EnumPublicEntityApiFields.salary_to.name: salaryTo,
    };
  }

  factory PublicVacancyDetail.fromMap(Map<String, dynamic> map) {
    final point =
        List<double>.from(map[EnumPublicEntityApiFields.point.name] as List);
    return PublicVacancyDetail(
      id: map[EnumPublicEntityApiFields.id.name] as int,
      title: map[EnumPublicEntityApiFields.title.name] as String,
      employerTitle:
          map[EnumPublicEntityApiFields.employer_title.name] as String,
      region: map[EnumPublicEntityApiFields.region.name] as String,
      distance: map[EnumPublicEntityApiFields.distance.name] as String,
      avatarUrl: map[EnumPublicEntityApiFields.avatar_url.name] as String,
      point: LatLng(point.first, point.last),
      createdAt: map[EnumPublicEntityApiFields.created_at.name] as String,
      description: map[EnumPublicEntityApiFields.description.name] as String,
      employmentType:
          map[EnumPublicEntityApiFields.employment_type.name] != null
              ? map[EnumPublicEntityApiFields.employment_type.name] as String
              : null,
      contactPhone: List<String>.from(
        map[EnumPublicEntityApiFields.contact_phone.name] as List,
      ),
      address: map[EnumPublicEntityApiFields.address.name] as String,
      salaryFrom: map[EnumPublicEntityApiFields.salary_from.name] as int,
      salaryTo: map[EnumPublicEntityApiFields.salary_to.name] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicVacancyDetail.fromJson(String source) =>
      PublicVacancyDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicVacancyDetail(id: $id, title: $title, employerTitle: $employerTitle, region: $region, distance: $distance, avatarUrl: $avatarUrl, point: $point, createdAt: $createdAt, description: $description, employmentType: $employmentType, contactPhone: $contactPhone, address: $address, salaryFrom: $salaryFrom, salaryTo: $salaryTo)';
  }

  @override
  bool operator ==(covariant PublicVacancyDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.employerTitle == employerTitle &&
        other.region == region &&
        other.distance == distance &&
        other.avatarUrl == avatarUrl &&
        // point removed from here
        other.createdAt == createdAt &&
        other.description == description &&
        other.employmentType == employmentType &&
        listEquals(other.contactPhone, contactPhone) &&
        other.address == address &&
        other.salaryFrom == salaryFrom &&
        other.salaryTo == salaryTo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        employerTitle.hashCode ^
        region.hashCode ^
        distance.hashCode ^
        avatarUrl.hashCode ^
        // point's hashcode removed from here
        createdAt.hashCode ^
        description.hashCode ^
        employmentType.hashCode ^
        contactPhone.hashCode ^
        address.hashCode ^
        salaryFrom.hashCode ^
        salaryTo.hashCode;
  }
}
