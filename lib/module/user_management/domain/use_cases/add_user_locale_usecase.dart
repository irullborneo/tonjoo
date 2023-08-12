import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';
import 'package:tonjoo/module/user_management/domain/schema/user_schema.dart';

class AddUserLocaleUsecase implements UseCase<Success, UserSchema> {
  final UserRepository _repository;

  const AddUserLocaleUsecase(this._repository);

  @override
  Future<Either<Failure, Success>> call(UserSchema schema) {
    return  _repository.addLocale(schema);
  }

}