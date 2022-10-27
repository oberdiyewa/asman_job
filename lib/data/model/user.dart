import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json['token'].toString(),
      );

  final String token;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
      };

  @override
  String toString() {
    return 'User token=$token';
  }

  static const empty = User(token: '');

  @override
  bool operator ==(covariant User other) => token == other.token;

  @override
  int get hashCode => token.hashCode;
}
