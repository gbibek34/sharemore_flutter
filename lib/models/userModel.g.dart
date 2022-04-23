// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

userModel _$userModelFromJson(Map<String, dynamic> json) => userModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      profile_picture: json['profile_picture'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$userModelToJson(userModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'profile_picture': instance.profile_picture,
      'createdAt': instance.createdAt,
    };
