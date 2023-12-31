import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';

class RemoveUserLocaleUsecase implements UseCase<Success, String> {
  final UserRepository _repository;

  const RemoveUserLocaleUsecase(this._repository);

  @override
  Future<Either<Failure, Success>> call(String id) {
    return  _repository.removeLocale(id);
  }

}