import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tonjoo/core/datasource/locale/user_locale.dart';
import 'package:tonjoo/core/datasource/remote/user_remote.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';
import 'package:tonjoo/module/user_management/domain/schema/user_schema.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemote _userRemote;
  final UserLocale _userLocale;

  const UserRepositoryImpl(this._userLocale, this._userRemote);

  @override
  Future<Either<Failure, List<UserEntity>>> lists(ListSchema schema)async {
    try {
      final res = await _userRemote.list();
      final List raw = res.data ?? [];
      return Right(raw.map((e) => UserModel.fromJson(e)).toList());
    } on DioError catch (err) {
      return const Left(
        Failure(
          message: 'data not found',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> addLocale(UserSchema schema)async {
    UserModel user = UserModel.fromSchema(schema);
    _userLocale.add(user);
    return const Right(Success(
      message: "Data saved"
    ));
  }

  @override
  Future<Either<Failure, Success>> removeLocale(int index)async {
    _userLocale.removeAt(index);
    return const Right(Success(message: "Data deleted"));
  }

  @override
  Future<Either<Failure, List<UserEntity>>> listsLocale()async {
    return Right(_userLocale.getList());
  }
}
