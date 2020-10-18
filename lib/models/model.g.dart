// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    completed: json['completed'] as bool,
  );
}

// ignore: unused_element
Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
