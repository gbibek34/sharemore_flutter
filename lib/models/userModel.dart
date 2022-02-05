import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class userModel {
  late String username;
  late String email;
  late String password;
  late String profile_picture;
  late String createdAt;

  userModel({
    required this.username,
    required this.email,
    required this.password,
    required this.profile_picture,
    required this.createdAt,
  });

  factory userModel.fromJson(Map<String, dynamic> json) =>
      _$userModelFromJson(json);
  Map<String, dynamic> toJson() => _$userModelToJson(this);
}
