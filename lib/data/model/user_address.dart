// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

@immutable
class UserAddress {
  final String id;
  final String? addressableType;
  final int addressableId;
  final String title;
  final String? region;
  final int addressType;
  final String address;
  final String? building;
  final String? floor;
  final String? door;
  final Location point;
  final String? description;
  final Map<String, dynamic>? meta;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final LatLng coordinates;

  const UserAddress({
    required this.addressableId,
    required this.title,
    required this.addressType,
    required this.address,
    required this.id,
    required this.point,
    required this.createdAt,
    required this.coordinates,
    this.addressableType,
    this.region,
    this.building,
    this.floor,
    this.door,
    this.description,
    this.meta,
    this.updatedAt,
    this.deletedAt,
  });

  UserAddress copyWith({
    String? id,
    String? addressableType,
    int? addressableId,
    String? title,
    String? region,
    int? addressType,
    String? address,
    String? building,
    String? floor,
    String? door,
    Location? point,
    String? description,
    Map<String, dynamic>? meta,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    LatLng? coordinates,
  }) {
    return UserAddress(
      id: id ?? this.id,
      addressableType: addressableType ?? this.addressableType,
      addressableId: addressableId ?? this.addressableId,
      title: title ?? this.title,
      region: region ?? this.region,
      addressType: addressType ?? this.addressType,
      address: address ?? this.address,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      door: door ?? this.door,
      point: point ?? this.point,
      description: description ?? this.description,
      meta: meta ?? this.meta,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // EnumAddressApiFields.meta.name: meta,
      // EnumAddressApiFields.created_at.name: createdAt,
      // EnumAddressApiFields.updated_at.name: updatedAt,
      // EnumAddressApiFields.deleted_at.name: deletedAt,
      // EnumAddressApiFields.addressable_type.name: addressableType,
      // EnumAddressApiFields.addressable_id.name: addressableId,
      // EnumAddressApiFields.region.name: region,
      // EnumAddressApiFields.address_type.name: addressType,
      // EnumAddressApiFields.building.name: building,
      // EnumAddressApiFields.floor.name: floor,
      // EnumAddressApiFields.door.name: door,
      // EnumAddressApiFields.description.name: description,
      // EnumAddressApiFields.coordinates.name: [
      //   coordinates.longitude,
      //   coordinates.latitude
      // ],
      EnumAddressApiFields.title.name: title,
      EnumAddressApiFields.address.name: address,
      EnumAddressApiFields.point.name: [
        {
          'lat': point.coordinates.latitude,
          'lng': point.coordinates.longitude,
        },
      ],
    };
  }

  factory UserAddress.fromMap(Map<String, dynamic> map) {
    final coords =
        map[EnumAddressApiFields.coordinates.name] as Map<String, dynamic>;
    return UserAddress(
      id: map[EnumAddressApiFields.id.name] as String,
      addressableType: map[EnumAddressApiFields.addressable_type.name] != null
          ? map[EnumAddressApiFields.addressable_type.name] as String
          : null,
      addressableId: map[EnumAddressApiFields.addressable_id.name] as int,
      title: map[EnumAddressApiFields.title.name] as String,
      region: map[EnumAddressApiFields.region.name] != null
          ? map[EnumAddressApiFields.region.name] as String
          : null,
      addressType: map[EnumAddressApiFields.address_type.name] as int,
      address: map[EnumAddressApiFields.address.name] as String,
      building: map[EnumAddressApiFields.building.name] != null
          ? map[EnumAddressApiFields.building.name] as String
          : null,
      floor: map[EnumAddressApiFields.floor.name] != null
          ? map[EnumAddressApiFields.floor.name] as String
          : null,
      door: map[EnumAddressApiFields.door.name] != null
          ? map[EnumAddressApiFields.door.name] as String
          : null,
      point: Location.fromMap(
        map[EnumAddressApiFields.point.name] as Map<String, dynamic>,
      ),
      description: map[EnumAddressApiFields.description.name] != null
          ? map[EnumAddressApiFields.description.name] as String
          : null,
      meta: map[EnumAddressApiFields.meta.name] != null
          ? Map<String, dynamic>.from(
              map[EnumAddressApiFields.meta.name] as Map<String, dynamic>,
            )
          : null,
      createdAt: map[EnumAddressApiFields.created_at.name] as String,
      updatedAt: map[EnumAddressApiFields.updated_at.name] != null
          ? map[EnumAddressApiFields.updated_at.name] as String
          : null,
      deletedAt: map[EnumAddressApiFields.deleted_at.name] != null
          ? map[EnumAddressApiFields.deleted_at.name] as String
          : null,
      coordinates: LatLng(
        coords['lat'] as double,
        coords['lng'] as double,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddress.fromJson(String source) =>
      UserAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, addressableType: $addressableType, addressableId: $addressableId, title: $title, region: $region, addressType: $addressType, address: $address, building: $building, floor: $floor, door: $door, point: $point, description: $description, meta: $meta, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, coordinates: $coordinates)';
  }

  @override
  bool operator ==(covariant UserAddress other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.addressableType == addressableType &&
        other.addressableId == addressableId &&
        other.title == title &&
        other.region == region &&
        other.addressType == addressType &&
        other.address == address &&
        other.building == building &&
        other.floor == floor &&
        other.door == door &&
        other.point == point &&
        other.description == description &&
        mapEquals(other.meta, meta) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.coordinates == coordinates;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        addressableType.hashCode ^
        addressableId.hashCode ^
        title.hashCode ^
        region.hashCode ^
        addressType.hashCode ^
        address.hashCode ^
        building.hashCode ^
        floor.hashCode ^
        door.hashCode ^
        point.hashCode ^
        description.hashCode ^
        meta.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        coordinates.hashCode;
  }
}
