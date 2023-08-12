import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote.g.dart';

@RestApi()
abstract class UserRemote {
  factory UserRemote(Dio dio, {String baseUrl}) = _UserRemote;

  @GET('/users')
  Future<HttpResponse> list();
}