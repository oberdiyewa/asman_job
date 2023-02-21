// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';

@immutable
class PublicProfileDetail {
  final int id;
  final int userId;
  final int? addressId;
  final String name;
  final String surname;
  final String? middleName;
  final String? birthDate;
  final String? gender;
  final bool? relocation;
  final String phone;
  final String? email;
  final String title;
  final String? aboutMe;
  final int avatarNumber;
  final String? status;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final UserAddress? address;
  final List<Experience>? experience;
  final List<Education>? education;
  final List<Language>? language;
  const PublicProfileDetail({
    required this.id,
    required this.userId,
    required this.name,
    required this.surname,
    required this.phone,
    required this.title,
    required this.avatarNumber,
    required this.createdAt,
    this.addressId,
    this.middleName,
    this.birthDate,
    this.gender,
    this.relocation,
    this.email,
    this.aboutMe,
    this.status,
    this.updatedAt,
    this.deletedAt,
    this.address,
    this.experience,
    this.education,
    this.language,
  });

  PublicProfileDetail copyWith({
    int? id,
    int? userId,
    int? addressId,
    String? name,
    String? surname,
    String? middleName,
    String? birthDate,
    String? gender,
    bool? relocation,
    String? phone,
    String? email,
    String? title,
    String? aboutMe,
    int? avatarNumber,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    UserAddress? address,
    List<Experience>? experience,
    List<Education>? education,
    List<Language>? language,
  }) {
    return PublicProfileDetail(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addressId: addressId ?? this.addressId,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      middleName: middleName ?? this.middleName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      relocation: relocation ?? this.relocation,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      title: title ?? this.title,
      aboutMe: aboutMe ?? this.aboutMe,
      avatarNumber: avatarNumber ?? this.avatarNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      address: address ?? this.address,
      experience: experience ?? this.experience,
      education: education ?? this.education,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    print('___________prof detail____________');
    return <String, dynamic>{
      EnumPublicEntityApiFields.id.name: id,
      EnumPublicEntityApiFields.user_id.name: userId,
      EnumPublicEntityApiFields.address_id.name: addressId,
      EnumPublicEntityApiFields.name.name: name,
      EnumPublicEntityApiFields.surname.name: surname,
      EnumPublicEntityApiFields.middle_name.name: middleName,
      EnumPublicEntityApiFields.birth_date.name: birthDate,
      EnumPublicEntityApiFields.gender.name: gender,
      EnumPublicEntityApiFields.relocation.name: relocation,
      EnumPublicEntityApiFields.phone.name: phone,
      EnumPublicEntityApiFields.email.name: email,
      EnumPublicEntityApiFields.title.name: title,
      EnumPublicEntityApiFields.about_me.name: aboutMe,
      EnumPublicEntityApiFields.avatar_number.name: avatarNumber,
      EnumPublicEntityApiFields.status.name: status,
      EnumPublicEntityApiFields.created_at.name: createdAt,
      EnumPublicEntityApiFields.updated_at.name: updatedAt,
      EnumPublicEntityApiFields.deleted_at.name: deletedAt,
      EnumPublicEntityApiFields.address.name: address!.toMap(),
      EnumPublicEntityApiFields.experience.name:
          experience!.map((x) => x.toMap()).toList(),
      EnumPublicEntityApiFields.education.name:
          education!.map((x) => x.toMap()).toList(),
      EnumPublicEntityApiFields.language.name:
          language!.map((x) => x.toMap()).toList(),
    };
  }

  factory PublicProfileDetail.fromMap(Map<String, dynamic> map) {
    return PublicProfileDetail(
      id: map[EnumPublicEntityApiFields.id.name] as int,
      userId: map[EnumPublicEntityApiFields.user_id.name] as int,
      addressId: map[EnumPublicEntityApiFields.address_id.name] != null
          ? map[EnumPublicEntityApiFields.address_id.name] as int
          : null,
      name: map[EnumPublicEntityApiFields.name.name] as String,
      surname: map[EnumPublicEntityApiFields.surname.name] as String,
      middleName: map[EnumPublicEntityApiFields.middle_name.name] != null
          ? map[EnumPublicEntityApiFields.middle_name.name] as String
          : null,
      birthDate: map[EnumPublicEntityApiFields.birth_date.name] != null
          ? map[EnumPublicEntityApiFields.birth_date.name] as String
          : null,
      gender: map[EnumPublicEntityApiFields.gender.name] != null
          ? map[EnumPublicEntityApiFields.gender.name] as String
          : null,
      relocation: map[EnumPublicEntityApiFields.relocation.name] != null
          ? map[EnumPublicEntityApiFields.relocation.name] as bool
          : null,
      phone: map[EnumPublicEntityApiFields.phone.name] as String,
      email: map[EnumPublicEntityApiFields.email.name] != null
          ? map[EnumPublicEntityApiFields.email.name] as String
          : null,
      title: map[EnumPublicEntityApiFields.title.name] as String,
      aboutMe: map[EnumPublicEntityApiFields.about_me.name] != null
          ? map[EnumPublicEntityApiFields.about_me.name] as String
          : null,
      avatarNumber: map[EnumPublicEntityApiFields.avatar_number.name] as int,
      status: map[EnumPublicEntityApiFields.status.name] != null
          ? map[EnumPublicEntityApiFields.status.name] as String
          : null,
      createdAt: map[EnumPublicEntityApiFields.created_at.name] as String,
      updatedAt: map[EnumPublicEntityApiFields.updated_at.name] != null
          ? map[EnumPublicEntityApiFields.updated_at.name] as String
          : null,
      deletedAt: map[EnumPublicEntityApiFields.deleted_at.name] != null
          ? map[EnumPublicEntityApiFields.deleted_at.name] as String
          : null,
      address: map[EnumPublicEntityApiFields.address.name] != null
          ? UserAddress.fromMap(map[EnumPublicEntityApiFields.address.name]
              as Map<String, dynamic>,)
          : null,
      experience: map[EnumPublicEntityApiFields.experience.name] != null
          ? List<Experience>.from(
              (map[EnumPublicEntityApiFields.experience.name] as List)
                  .map<Experience>(
                (x) => Experience.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      education: map[EnumPublicEntityApiFields.education.name] != null
          ? List<Education>.from(
              (map[EnumPublicEntityApiFields.education.name] as List)
                  .map<Education>(
                (x) => Education.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      language: map[EnumPublicEntityApiFields.language.name] != null
          ? List<Language>.from(
              (map[EnumPublicEntityApiFields.language.name] as List)
                  .map<Language>(
                (x) => Language.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicProfileDetail.fromJson(String source) =>
      PublicProfileDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublicProfileDetail(id: $id, userId: $userId, addressId: $addressId, name: $name, surname: $surname, middleName: $middleName, birthDate: $birthDate, gender: $gender, relocation: $relocation, phone: $phone, email: $email, title: $title, aboutMe: $aboutMe, avatarNumber: $avatarNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, address: $address, experience: $experience, education: $education, language: $language)';
  }

  @override
  bool operator ==(covariant PublicProfileDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.addressId == addressId &&
        other.name == name &&
        other.surname == surname &&
        other.middleName == middleName &&
        other.birthDate == birthDate &&
        other.gender == gender &&
        other.relocation == relocation &&
        other.phone == phone &&
        other.email == email &&
        other.title == title &&
        other.aboutMe == aboutMe &&
        other.avatarNumber == avatarNumber &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.address == address &&
        listEquals(other.experience, experience) &&
        listEquals(other.education, education) &&
        listEquals(other.language, language);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        addressId.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        middleName.hashCode ^
        birthDate.hashCode ^
        gender.hashCode ^
        relocation.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        title.hashCode ^
        aboutMe.hashCode ^
        avatarNumber.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        address.hashCode ^
        experience.hashCode ^
        education.hashCode ^
        language.hashCode;
  }
}
