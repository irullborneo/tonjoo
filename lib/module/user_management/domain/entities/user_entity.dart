import 'package:equatable/equatable.dart';

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
