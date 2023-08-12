import 'package:json_annotation/json_annotation.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/schema/user_schema.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  @JsonKey(name: 'username')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  const UserModel(
      {required String? id,
      required this.firstName,
      required this.lastName,
      required String? gender,
      required String? email,
      required String? avatar})
      : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            email: email,
            avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromSchema(UserSchema schema){
    return UserModel(
      id: null,
      firstName: schema.firstName,
      lastName: schema.lastName,
      gender: schema.gender,
      email: schema.email,
      avatar: schema.path
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
