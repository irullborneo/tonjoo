import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/auth/domain/repositories/auth_repository.dart';
import 'package:tonjoo/module/auth/domain/schema/login_schema.dart';

class LoginUsecase implements UseCase<Success, LoginSchema> {
  final AuthRepository _repository;

  const LoginUsecase(this._repository);

  @override
  Future<Either<Failure, Success>> call(LoginSchema params) {
    return  _repository.login(params);
  }

}