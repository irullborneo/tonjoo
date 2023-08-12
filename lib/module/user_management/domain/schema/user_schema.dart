class UserSchema {
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? email;
  final String? path;

  UserSchema({
    required this.gender,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.path
  });
}
