import 'package:json_annotation/json_annotation.dart';

part 'login_schema.g.dart';

@JsonSerializable()
class LoginSchema {
  final String user;
  final String password;

  const LoginSchema({required this.user, required this.password});

  Map<String, dynamic> toJson() => _$LoginSchemaToJson(this);

}
