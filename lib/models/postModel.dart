import 'package:json_annotation/json_annotation.dart';

part 'postModel.g.dart';

@JsonSerializable()
class postModel {
  String? title;
  String? description;
  String? image;
  String? username;
  String? category;
  String? createdAt;

  postModel({
    this.title,
    this.description,
    this.image,
    this.username,
    this.category,
    this.createdAt,
  });

  factory postModel.fromJson(Map<String, dynamic> json) =>
      _$postModelFromJson(json);
  Map<String, dynamic> toJson() => _$postModelToJson(this);
}
