import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tonjoo/core/models/auth_model.dart';
import 'package:tonjoo/module/auth/domain/schema/login_schema.dart';
part 'auth_remote.g.dart';

@RestApi()
abstract class AuthRemote {
  factory AuthRemote(Dio dio, {String baseUrl}) = _AuthRemote;

  @POST('/login')
  Future<AuthModel> login(@Body() LoginSchema schema);
}