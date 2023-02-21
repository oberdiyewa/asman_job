// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceAddress {
 final String displayName;
  ServiceAddress({
    required this.displayName,
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
  }) {
    return ServiceAddress(
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'display_name': displayName,
    };
  }

  factory ServiceAddress.fromMap(Map<String, dynamic> map) {
    return ServiceAddress(
      displayName: map['display_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceAddress.fromJson(String source) => ServiceAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ServiceAddress(displayName: $displayName)';

  @override
  bool operator ==(covariant ServiceAddress other) {
    if (identical(this, other)) return true;
  
    return 
      other.displayName == displayName;
  }

  @override
  int get hashCode => displayName.hashCode;
}
