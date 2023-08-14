import 'package:equatable/equatable.dart';
import 'package:tonjoo/core/databases/user_db.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? avatar;

  const UserEntity(
      {required this.email,
      required this.id,
      required this.lastName,
      required this.firstName,
      required this.avatar,
      required this.gender});

  factory UserEntity.fromLocale(UserDB user){
    return UserEntity(
      id: user.id,
      firstName: user.firstname,
      lastName: user.lastName,
      email: user.email,
      gender: user.gender,
      avatar: user.avatar
    );
  }

  String fullName() {
    String name = firstName??"";
    if(lastName != null){
      name += " ${lastName!}";
    }
    return name;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        avatar,
        gender,
      ];
}
