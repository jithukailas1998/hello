import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part "model.g.dart";

@JsonSerializable()
class UserModel {
  int userId;
  int id;
  String title;
  bool completed;

  UserModel({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
