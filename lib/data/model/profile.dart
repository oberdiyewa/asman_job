  // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/material.dart';

@immutable
class Profile {
  final String name;
  final String surname;
  final String? middleName;
  final String gender;
  final String phone;
  final String birthDate;
  final String? email;
  final String title;
  final String? aboutMe;
  final int? avatarNumber;
  final String? image;
 const Profile({
    required this.name,
    required this.surname,
    required this.gender,
    required this.phone,
    required this.birthDate,
    required this.title,
    this.middleName,
    this.email,
    this.aboutMe,
    this.avatarNumber,
    this.image,
  });

  Profile copyWith({
    String? name,
    String? surname,
    String? middleName,
    String? gender,
    String? phone,
    String? birthDate,
    String? email,
    String? title,
    String? aboutMe,
    int? avatarNumber,
    String? image,
  }) {
    return Profile(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      middleName: middleName ?? this.middleName,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      title: title ?? this.title,
      aboutMe: aboutMe ?? this.aboutMe,
      avatarNumber: avatarNumber ?? this.avatarNumber,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumProfileApiFields.name.name: name,
      EnumProfileApiFields.surname.name: surname,
      EnumProfileApiFields.middle_name.name: middleName,
      EnumProfileApiFields.gender.name: gender,
      EnumProfileApiFields.phone.name: phone,
      EnumProfileApiFields.birth_date.name: birthDate,
      EnumProfileApiFields.email.name: email,
      EnumProfileApiFields.title.name: title,
      EnumProfileApiFields.about_me.name: aboutMe,
      EnumProfileApiFields.avatar_number.name: avatarNumber,
      EnumProfileApiFields.image.name: image,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map[EnumProfileApiFields.name.name] as String,
      surname: map[EnumProfileApiFields.surname.name] as String,
      middleName: map[EnumProfileApiFields.middle_name.name] != null
          ? map[EnumProfileApiFields.middle_name.name] as String
          : null,
      gender: map[EnumProfileApiFields.gender.name] as String,
      phone: map[EnumProfileApiFields.phone.name] as String,
      birthDate: map[EnumProfileApiFields.birth_date.name] as String,
      email: map[EnumProfileApiFields.email.name] != null
          ? map[EnumProfileApiFields.email.name] as String
          : null,
      title: map[EnumProfileApiFields.title.name] as String,
      aboutMe: map[EnumProfileApiFields.about_me.name] != null
          ? map[EnumProfileApiFields.about_me.name] as String
          : null,
      avatarNumber: map[EnumProfileApiFields.avatar_number.name] != null
          ? map[EnumProfileApiFields.avatar_number.name] as int
          : null,
      image: map[EnumProfileApiFields.image.name] != null
          ? map[EnumProfileApiFields.image.name] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(name: $name, surname: $surname, middleName: $middleName, gender: $gender, phone: $phone, birthDate: $birthDate, email: $email, title: $title, aboutMe: $aboutMe, avatarNumber: $avatarNumber, image: $image)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.surname == surname &&
        other.middleName == middleName &&
        other.gender == gender &&
        other.phone == phone &&
        other.birthDate == birthDate &&
        other.email == email &&
        other.title == title &&
        other.aboutMe == aboutMe &&
        other.avatarNumber == avatarNumber &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surname.hashCode ^
        middleName.hashCode ^
        gender.hashCode ^
        phone.hashCode ^
        birthDate.hashCode ^
        email.hashCode ^
        title.hashCode ^
        aboutMe.hashCode ^
        avatarNumber.hashCode ^
        image.hashCode;
  }
}
