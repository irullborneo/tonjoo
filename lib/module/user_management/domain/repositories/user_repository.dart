import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/schema/user_schema.dart';

abstract class UserRepository {

  Future<Either<Failure, List<UserModel>>> lists(ListSchema schema);
  Future<Either<Failure, List<UserEntity>>> fetch(ListSchema schema);
  Future<Either<Failure, Success>> addLocale(UserSchema schema);
  Future<Either<Failure, Success>> removeLocale(String id);
  Future<Either<Failure, int>> countLocale();
  Future<Either<Failure, Success>> addAllLocale(List<UserModel> data);
}
