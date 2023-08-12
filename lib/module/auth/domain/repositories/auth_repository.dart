import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/auth/domain/schema/login_schema.dart';

abstract class AuthRepository {

  Future<Either<Failure, Success>> login(LoginSchema schema);
  Future<Either<Failure, bool>> checkedAuth();
  Future<Either<Failure, Success>> logout();
}