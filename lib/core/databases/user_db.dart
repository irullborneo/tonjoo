import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserDB {
  final String id;
  final String firstname;
  final String lastName;
  final String email;
  final String gender;
  final String avatar;

  static const tableName = 'user';
  static const idField = 'id';
  static const genderField = 'gender';
  static const avatarField = 'avatar';
  static const firstNameField = 'first_name';
  static const lastNameField = 'last_name';
  static const emailField = 'email';

  UserDB({
    required this.id,
    required this.firstname,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.avatar,
  });

  factory UserDB.fromUserModel(UserModel user) {
    var uuid = const Uuid();
    return UserDB(
        id: user.id ?? uuid.v4(),
        firstname: user.firstName ?? "-",
        lastName: user.lastName ?? "-",
        email: user.email ?? "-",
        gender: user.gender ?? "-",
        avatar: user.avatar ?? "-");
  }

  Map<String, dynamic> toMap() {
    return {
      idField: id,
      firstNameField: firstname,
      lastNameField: lastName,
      avatarField: avatar,
      genderField: gender,
      emailField: email,
    };
  }

  @override
  String toString() {
    return 'user{$idField: $id, $firstNameField: $firstname, $lastNameField: $lastName, $emailField: $email, $genderField: $gender, $avatarField: $avatar,}';
  }
}
