// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// import 'dart:convert';
//
// class User {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//   final String email;
//
//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.phoneNumber,
//     required this.email,
//   });
//
//   User copyWith({
//     String? id,
//     String? firstName,
//     String? lastName,
//     String? phoneNumber,
//     String? email,
//   }) =>
//       User(
//         id: id ?? this.id,
//         firstName: firstName ?? this.firstName,
//         lastName: lastName ?? this.lastName,
//         phoneNumber: phoneNumber ?? this.phoneNumber,
//         email: email ?? this.email,
//       );
//
//   factory User.fromRawJson(String str) => User.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         phoneNumber: json["phoneNumber"],
//         email: json["email"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "phoneNumber": phoneNumber,
//         "email": email,
//       };
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
  }) = _User;

  factory User.initial() => const User(
      id: '', firstName: '', lastName: '', phoneNumber: '', email: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
