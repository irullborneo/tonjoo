import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tonjoo/core/datasource/locale/auth_locale.dart';
import 'package:tonjoo/core/datasource/remote/auth_remote.dart';
import 'package:tonjoo/core/models/auth_model.dart';
import 'package:tonjoo/core/params/failure_param.dart';
import 'package:tonjoo/core/params/success_param.dart';
import 'package:tonjoo/module/auth/domain/repositories/auth_repository.dart';
import 'package:tonjoo/module/auth/domain/schema/login_schema.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote _authRemote;
  final AuthLocale _authLocale;
  final Dio _dio;

  const AuthRepositoryImpl(this._authRemote, this._authLocale, this._dio);
  @override
  Future<Either<Failure, Success>> login(LoginSchema schema) async {
    try {
      final response = await _authRemote.login(schema);
      _authLocale.setAuth(response);
      _dio.options.headers = _authLocale.getHeader();

      return const Right(Success(message: "Login sucess"));
    } on DioError catch (err) {
      if (err.response?.data is Map) {
        final res = err.response!.data;
        final List data = res['data'] ?? [];
        return Left(
          Failure(
            message: res['message'] ?? 'Login Failed',
          ),
        );
      }

      return const Left(
        Failure(
          message: 'Login Failed!',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkedAuth() async {
    final res = _authLocale.getAuth();
    return Right(res != null);
  }

  @override
  Future<Either<Failure, Success>> logout()async {
    _authLocale.removeAuth();
    return const Right(Success(
      message: "Logout success"
    ));
  }
}
