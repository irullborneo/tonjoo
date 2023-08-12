import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase implements UseCase<Success, NoParams> {
  final AuthRepository _repository;

  const LogoutUsecase(this._repository);

  @override
  Future<Either<Failure, Success>> call(NoParams params) {
    return  _repository.logout();
  }

}