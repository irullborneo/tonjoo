import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';

class GetUserLocaleUsecase implements UseCase<List<UserEntity>, NoParams> {
  final UserRepository _repository;

  const GetUserLocaleUsecase(this._repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) {
    return  _repository.listsLocale();
  }

}