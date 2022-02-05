// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

postModel _$postModelFromJson(Map<String, dynamic> json) => postModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      username: json['username'] as String?,
      category: json['category'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$postModelToJson(postModel instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'username': instance.username,
      'category': instance.category,
      'createdAt': instance.createdAt,
    };
