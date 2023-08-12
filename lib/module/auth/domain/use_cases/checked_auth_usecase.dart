import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/auth/domain/repositories/auth_repository.dart';

class CheckedAuthUsecase implements UseCase<bool, NoParams> {
  final AuthRepository _repository;

  const CheckedAuthUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return  _repository.checkedAuth();
  }

}