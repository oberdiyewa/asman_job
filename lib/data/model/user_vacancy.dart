// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserVacancy {
  final int id;
  final int userId;
  final int? addressId;
  final int industryId;
  final String title;
  final String employerTitle;
  final String? description;
  final num? salaryFrom;
  final num? salaryTo;
  final bool? byAgreement;
  final bool? disabilityPeople;
  final String empType;
  final List<String> contactPhone;
  final String? contactEmail;
  final String? status;
  final String? publishAt;
  final String expiresAt;
  final int? expirationDays;
  final int? avatarNumber;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? address;
  const UserVacancy({
    required this.id,
    required this.userId,
    this.addressId,
    required this.industryId,
    required this.title,
    required this.employerTitle,
    this.description,
    this.salaryFrom,
    this.salaryTo,
    this.byAgreement,
    this.disabilityPeople,
    required this.empType,
    required this.contactPhone,
    this.contactEmail,
    this.status,
    this.publishAt,
    required this.expiresAt,
    this.expirationDays,
    this.avatarNumber,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.address,
  });

  UserVacancy copyWith({
    int? id,
    int? userId,
    int? addressId,
    int? industryId,
    String? title,
    String? employerTitle,
    String? description,
    num? salaryFrom,
    num? salaryTo,
    bool? byAgreement,
    bool? disabilityPeople,
    String? empType,
    List<String>? contactPhone,
    String? contactEmail,
    String? status,
    String? publishAt,
    String? expiresAt,
    int? expirationDays,
    int? avatarNumber,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? address,
  }) {
    return UserVacancy(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addressId: addressId ?? this.addressId,
      industryId: industryId ?? this.industryId,
      title: title ?? this.title,
      employerTitle: employerTitle ?? this.employerTitle,
      description: description ?? this.description,
      salaryFrom: salaryFrom ?? this.salaryFrom,
      salaryTo: salaryTo ?? this.salaryTo,
      byAgreement: byAgreement ?? this.byAgreement,
      disabilityPeople: disabilityPeople ?? this.disabilityPeople,
      empType: empType ?? this.empType,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      status: status ?? this.status,
      publishAt: publishAt ?? this.publishAt,
      expiresAt: expiresAt ?? this.expiresAt,
      expirationDays: expirationDays ?? this.expirationDays,
      avatarNumber: avatarNumber ?? this.avatarNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'address_id': addressId,
      'industry_id': industryId,
      'title': title,
      'employer_title': employerTitle,
      'description': description,
      'salary_from': salaryFrom,
      'salary_to': salaryTo,
      'by_agreement': byAgreement,
      'disability_people': disabilityPeople,
      'emp_type': empType,
      'contact_phone': contactPhone,
      'contact_email': contactEmail,
      'status': status,
      'publish_at': publishAt,
      'expires_at': expiresAt,
      'expiration_days': expirationDays,
      'avatar_number': avatarNumber,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'address': address,
    };
  }

  factory UserVacancy.fromMap(Map<String, dynamic> map) {
    final phone = (map['contact_phone'] as List)[0];
    return UserVacancy(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      addressId: map['address_id'] != null ? map['address_id'] as int : null,
      industryId: map['industry_id'] as int,
      title: map['title'] as String,
      employerTitle: map['employer_title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      salaryFrom: map['salary_from'] != null ? map['salary_from'] as num : null,
      salaryTo: map['salary_to'] != null ? map['salary_to'] as num : null,
      byAgreement:
          map['by_agreement'] != null ? map['by_agreement'] as bool : null,
      disabilityPeople: map['disability_people'] != null
          ? map['disability_people'] as bool
          : null,
      empType: map['emp_type'] as String,
      contactPhone: List<String>.from(phone as List),
      contactEmail:
          map['contact_email'] != null ? map['contact_email'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      publishAt: map['publish_at'] != null ? map['publish_at'] as String : null,
      expiresAt: map['expires_at'] as String,
      expirationDays:
          map['expiration_days'] != null ? map['expiration_days'] as int : null,
      avatarNumber:
          map['avatar_number'] != null ? map['avatar_number'] as int : null,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      deletedAt: map['deleted_at'] != null ? map['deleted_at'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVacancy.fromJson(String source) =>
      UserVacancy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserVacancy(id: $id, user_id: $userId, address_id: $addressId, industry_id: $industryId, title: $title, employer_title: $employerTitle, description: $description, salary_from: $salaryFrom, salary_to: $salaryTo, by_agreement: $byAgreement, disability_people: $disabilityPeople, emp_type: $empType, contact_phone: $contactPhone, contact_email: $contactEmail, status: $status, publish_at: $publishAt, expires_at: $expiresAt, expiration_days: $expirationDays, avatar_number: $avatarNumber, created_at: $createdAt, updated_at: $updatedAt, deleted_at: $deletedAt, address: $address)';
  }

  @override
  bool operator ==(covariant UserVacancy other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.addressId == addressId &&
        other.industryId == industryId &&
        other.title == title &&
        other.employerTitle == employerTitle &&
        other.description == description &&
        other.salaryFrom == salaryFrom &&
        other.salaryTo == salaryTo &&
        other.byAgreement == byAgreement &&
        other.disabilityPeople == disabilityPeople &&
        other.empType == empType &&
        listEquals(other.contactPhone, contactPhone) &&
        other.contactEmail == contactEmail &&
        other.status == status &&
        other.publishAt == publishAt &&
        other.expiresAt == expiresAt &&
        other.expirationDays == expirationDays &&
        other.avatarNumber == avatarNumber &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        addressId.hashCode ^
        industryId.hashCode ^
        title.hashCode ^
        employerTitle.hashCode ^
        description.hashCode ^
        salaryFrom.hashCode ^
        salaryTo.hashCode ^
        byAgreement.hashCode ^
        disabilityPeople.hashCode ^
        empType.hashCode ^
        contactPhone.hashCode ^
        contactEmail.hashCode ^
        status.hashCode ^
        publishAt.hashCode ^
        expiresAt.hashCode ^
        expirationDays.hashCode ^
        avatarNumber.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        address.hashCode;
  }
}
