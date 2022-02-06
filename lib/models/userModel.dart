import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class userModel {
  String? username;
  String? email;
  String? password;
  String? profile_picture;
  String? createdAt;

  userModel({
    this.username,
    this.email,
    this.password,
    this.profile_picture,
    this.createdAt,
  });

  factory userModel.fromJson(Map<String, dynamic> json) =>
      _$userModelFromJson(json);
  Map<String, dynamic> toJson() => _$userModelToJson(this);
}
