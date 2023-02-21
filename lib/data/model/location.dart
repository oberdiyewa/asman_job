// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

@immutable
class Location {
  final String type;
  final LatLng coordinates;
  const Location({
    required this.type,
    required this.coordinates,
  });

  Location copyWith({
    String? type,
    LatLng? coordinates,
  }) {
    return Location(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'coordinates': [coordinates.longitude, coordinates.latitude],
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    final coordinates = List<double>.from(map['coordinates'] as List);

    return Location(
      type: map['type'] as String,
      coordinates: LatLng(
        coordinates[1],
        coordinates[0],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(type: $type, coordinates: $coordinates)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.type == type && other.coordinates == coordinates;
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode;
}
