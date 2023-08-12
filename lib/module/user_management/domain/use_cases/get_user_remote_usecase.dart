import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';

class GetUserRemoteUsecase implements UseCase<List<UserEntity>, ListSchema> {
  final UserRepository _repository;

  const GetUserRemoteUsecase(this._repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(ListSchema params) {
    return  _repository.lists(params);
  }

}