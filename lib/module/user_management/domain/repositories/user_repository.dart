import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/schema/user_schema.dart';

abstract class UserRepository {

  Future<Either<Failure, List<UserEntity>>> lists(ListSchema schema);
  Future<Either<Failure, List<UserEntity>>> listsLocale();
  Future<Either<Failure, Success>> addLocale(UserSchema schema);
  Future<Either<Failure, Success>> removeLocale(int index);
}