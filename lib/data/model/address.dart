// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:asman_work/utils/globals/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

@immutable
class Address {
  final String address;
  final String title;
  final List<LatLng> point;
  const Address({
    required this.address,
    required this.title,
    required this.point,
  });

  Address copyWith({
    String? address,
    String? title,
    List<LatLng>? point,
  }) {
    return Address(
      address: address ?? this.address,
      title: title ?? this.title,
      point: point ?? this.point,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      EnumVacancyDetailApiFields.address.name: address,
      EnumVacancyApiFields.title.name: title,
      EnumVacancyApiFields.point.name: point
          .map<Map<String, double>>(
            (x) => {'lat': x.latitude, 'lng': x.longitude},
          )
          .toList(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map[EnumVacancyDetailApiFields.address.name] as String,
      title: map[EnumVacancyApiFields.title.name] as String,
      point: List<LatLng>.from(
        (map[EnumVacancyApiFields.point.name] as List<Map<String, double>>)
            .map<LatLng>(
          (x) => LatLng(x['lat']!, x['lng']!),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Address(address: $address, title: $title, point: $point)';

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.title == title &&
        listEquals(other.point, point);
  }

  @override
  int get hashCode => address.hashCode ^ title.hashCode ^ point.hashCode;
}
