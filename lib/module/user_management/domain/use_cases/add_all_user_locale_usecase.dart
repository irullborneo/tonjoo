import 'package:dartz/dartz.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';

class AddAllUserLocaleUsecase implements UseCase<Success, List<UserModel>> {
  final UserRepository _repository;

  const AddAllUserLocaleUsecase(this._repository);

  @override
  Future<Either<Failure, Success>> call(List<UserModel> data) {
    return  _repository.addAllLocale(data);
  }

}