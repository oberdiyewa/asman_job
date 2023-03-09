// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';

@immutable
class ServiceAddress {
  final String displayName;
  final String? title;
  final LatLng? point;
  const ServiceAddress({
    required this.displayName,
    this.title,
    this.point,
  });
  //   "road": "Esgerler (Rostow, 2029) köçesi",
  //  ? "neighbourhood": "30 Etrap",
  //   "borough": "Bagtyýarlyk etraby",
  //   "city": "Aşgabat",
  //  ? "postcode": "744020",
  //   "country": "Türkmenistan",
  //   "country_code": "tm"

  ServiceAddress copyWith({
    String? displayName,
    String? title,
    LatLng? point,
  }) {
    return ServiceAddress(
      displayName: displayName ?? this.displayName,
      title: title ?? this.title,
      point: point ?? this.point,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': displayName,
      'title': title,
      'point': {'lat': point!.latitude, 'lng': point!.longitude}
    };
  }

  factory ServiceAddress.fromMap(Map<String, dynamic> map) {
    return ServiceAddress(
      displayName: map['display_name'] as String,
      point: LatLng(
        double.tryParse(map['lat'] as String) ?? 0.0,
        double.tryParse(map['lon'] as String) ?? 0.0,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceAddress.fromJson(String source) =>
      ServiceAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ServiceAddress(displayName: $displayName, point: $point)';

  @override
  bool operator ==(covariant ServiceAddress other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName;
  }

  @override
  int get hashCode => displayName.hashCode;
}
