// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
class Vacancy {
  final int id;
  final String title;
  final String employerTitle;
  final String region;
  final String distance;
  final String avatarUrl;
  final LatLng point;
  final String createdAt;

  const Vacancy({
    required this.id,
    required this.title,
    required this.employerTitle,
    required this.region,
    required this.distance,
    required this.avatarUrl,
    required this.point,
    required this.createdAt,
  });

  Vacancy copyWith({
    int? id,
    String? title,
    String? region,
    String? employerTitle,
    String? distance,
    String? avatarUrl,
    LatLng? point,
    String? createdAt,
  }) {
    return Vacancy(
      id: id ?? this.id,
      title: title ?? this.title,
      employerTitle: employerTitle ?? this.employerTitle,
      region: region ?? this.region,
      distance: distance ?? this.distance,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      point: point ?? this.point,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumVacancyApiFields.id.name: id,
      EnumVacancyApiFields.title.name: title,
      EnumVacancyApiFields.employer_title.name: employerTitle,
      EnumVacancyApiFields.region.name: region,
      EnumVacancyApiFields.distance.name: distance,
      EnumVacancyApiFields.avatar_url.name: avatarUrl,
      EnumVacancyApiFields.point.name: [point.latitude, point.longitude],
      EnumVacancyApiFields.created_at.name: createdAt,
    };
  }

  factory Vacancy.fromMap(Map<String, dynamic> map) {
    final point =
        List<double>.from(map[EnumVacancyApiFields.point.name] as List);
    return Vacancy(
      id: map[EnumVacancyApiFields.id.name] as int,
      title: map[EnumVacancyApiFields.title.name] as String,
      employerTitle: map[EnumVacancyApiFields.employer_title.name] as String,
      region: map[EnumVacancyApiFields.region.name] as String,
      distance: map[EnumVacancyApiFields.distance.name] as String,
      avatarUrl: map[EnumVacancyApiFields.avatar_url.name] as String,
      point: LatLng(point.first, point.last),
      createdAt: map[EnumVacancyApiFields.created_at.name] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vacancy.fromJson(String source) =>
      Vacancy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Vacancy(id: $id, title: $title, employerTitle: $employerTitle, region: $region, distance: $distance, avatarUrl: $avatarUrl, point: $point, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Vacancy other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.employerTitle == employerTitle &&
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
        region.hashCode ^
        distance.hashCode ^
        avatarUrl.hashCode ^
        point.hashCode ^
        createdAt.hashCode;
  }
}

// ======================    Vacancy Details    ======================

@immutable
class VacancyDetail {
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
  const VacancyDetail({
    required this.id,
    required this.title,
    required this.employerTitle,
    required this.region,
    required this.distance,
    required this.avatarUrl,
    required this.point,
    required this.createdAt,
    required this.description,
    this.employmentType,
    required this.contactPhone,
    required this.address,
    required this.salaryFrom,
    required this.salaryTo,
  });

  VacancyDetail copyWith({
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
    return VacancyDetail(
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
      EnumVacancyApiFields.id.name: id,
      EnumVacancyApiFields.title.name: title,
      EnumVacancyApiFields.employer_title.name: employerTitle,
      EnumVacancyApiFields.region.name: region,
      EnumVacancyApiFields.distance.name: distance,
      EnumVacancyApiFields.avatar_url.name: avatarUrl,
      EnumVacancyApiFields.point.name: [point.latitude, point.longitude],
      EnumVacancyApiFields.created_at.name: createdAt,
      EnumVacancyApiFields.description.name: description,
      EnumVacancyApiFields.employment_type.name: employmentType,
      EnumVacancyApiFields.contact_phone.name: contactPhone,
      EnumVacancyApiFields.address.name: address,
      EnumVacancyApiFields.salary_from.name: salaryFrom,
      EnumVacancyApiFields.salary_to.name: salaryTo,
    };
  }

  factory VacancyDetail.fromMap(Map<String, dynamic> map) {
    final point =
        List<double>.from(map[EnumVacancyApiFields.point.name] as List);
    return VacancyDetail(
      id: map[EnumVacancyApiFields.id.name] as int,
      title: map[EnumVacancyApiFields.title.name] as String,
      employerTitle: map[EnumVacancyApiFields.employer_title.name] as String,
      region: map[EnumVacancyApiFields.region.name] as String,
      distance: map[EnumVacancyApiFields.distance.name] as String,
      avatarUrl: map[EnumVacancyApiFields.avatar_url.name] as String,
      point: LatLng(point.first, point.last),
      createdAt: map[EnumVacancyApiFields.created_at.name] as String,
      description: map[EnumVacancyApiFields.description.name] as String,
      employmentType: map[EnumVacancyApiFields.employment_type.name] != null
          ? map[EnumVacancyApiFields.employment_type.name] as String
          : null,
      contactPhone: List<String>.from(
        map[EnumVacancyApiFields.contact_phone.name] as List,
      ),
      address: map[EnumVacancyApiFields.address.name] as String,
      salaryFrom: map[EnumVacancyApiFields.salary_from.name] as int,
      salaryTo: map[EnumVacancyApiFields.salary_to.name] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VacancyDetail.fromJson(String source) =>
      VacancyDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VacancyDetail(id: $id, title: $title, employerTitle: $employerTitle, region: $region, distance: $distance, avatarUrl: $avatarUrl, point: $point, createdAt: $createdAt, description: $description, employmentType: $employmentType, contactPhone: $contactPhone, address: $address, salaryFrom: $salaryFrom, salaryTo: $salaryTo)';
  }

  @override
  bool operator ==(covariant VacancyDetail other) {
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
