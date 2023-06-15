// To parse this JSON data, do
//
//     final initData = initDataFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'init_data.freezed.dart';
part 'init_data.g.dart';

InitData initDataFromJson(String str) => InitData.fromJson(json.decode(str));

String initDataToJson(InitData data) => json.encode(data.toJson());

@freezed
class InitData with _$InitData {
  const factory InitData({
    List<Application>? applications,
    User? user,
  }) = _InitData;

  factory InitData.fromJson(Map<String, dynamic> json) =>
      _$InitDataFromJson(json);
}

@freezed
class Application with _$Application {
  const factory Application({
    String? id,
    String? name,
    String? displayName,
    String? icon,
    bool? disabled,
    dynamic routes,
    dynamic menus,
  }) = _Application;

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
