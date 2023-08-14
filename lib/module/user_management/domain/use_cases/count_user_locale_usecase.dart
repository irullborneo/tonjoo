import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';

class CountUserLocaleUsecase implements UseCase<int, NoParams> {
  final UserRepository _repository;

  const CountUserLocaleUsecase(this._repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return  _repository.countLocale();
  }

}