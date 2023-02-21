// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class User {
  final int id;
  final int userId;
  final String phone;
  final String? email;  
  final String locale;
  final String firstname;
  final String lastname;
  final bool isBlocked;
  final String? addressId;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  const User({
    required this.id,
    required this.userId,
    required this.phone,
    required this.locale,
    required this.firstname,
    required this.lastname,
    required this.isBlocked,
    this.email,
    this.addressId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int? id,
    int? userId,
    String? phone,
    String? email,
    String? locale,
    String? firstname,
    String? lastname,
    bool? isBlocked,
    String? addressId,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      locale: locale ?? this.locale,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      isBlocked: isBlocked ?? this.isBlocked,
      addressId: addressId ?? this.addressId,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'phone': phone,
      'email': email,
      'locale': locale,
      'firstname': firstname,
      'lastname': lastname,
      'is_blocked': isBlocked,
      'address_id': addressId,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      phone: map['phone'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      locale: map['locale'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      isBlocked: map['is_blocked'] as bool,
      addressId: map['address_id'] != null ? map['address_id'] as String : null,
      deletedAt: map['deleted_at'] != null ? map['deleted_at'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, userId: $userId, phone: $phone, email: $email, locale: $locale, firstname: $firstname, lastname: $lastname, isBlocked: $isBlocked, addressId: $addressId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.phone == phone &&
        other.email == email &&
        other.locale == locale &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.isBlocked == isBlocked &&
        other.addressId == addressId &&
        other.deletedAt == deletedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        locale.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        isBlocked.hashCode ^
        addressId.hashCode ^
        deletedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
