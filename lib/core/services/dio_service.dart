
import 'package:tonjoo/config/routes/tj_routes.dart';
import 'package:tonjoo/core/datasource/locale/auth_locale.dart';
import 'package:tonjoo/core/enums/message_type.dart';
import 'package:tonjoo/core/params/send_message_param.dart';
import 'package:tonjoo/core/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

Dio dioServices() {
  Dio dio = Dio();
  final auth = AuthLocale();

  dio.options.baseUrl = Env.baseUrl();
  dio.options.headers = auth.getHeader();
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.requestOptions.path == '/auth/refresh') {
          auth.removeAuth();
          Get.offAllNamed(
            TjRoutes.INITIATE,
            arguments: const SendMessageParams(
              title: 'Unauthorized',
              message: 'Session expired',
              type: MessageType.error,
            ),
          );
        } else {
          return handler.next(e);
        }
      },
    ),
  );

  return dio;
}
