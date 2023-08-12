import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tonjoo/core/datasource/locale/auth_locale.dart';
import 'package:tonjoo/core/datasource/locale/user_locale.dart';
import 'package:tonjoo/core/datasource/remote/auth_remote.dart';
import 'package:tonjoo/core/datasource/remote/user_remote.dart';
import 'package:tonjoo/core/services/dio_service.dart';
import 'package:tonjoo/di/user_management_dependencies.dart';

import 'auth_dependencies.dart';

final injectore = GetIt.instance;

Future<void> inisializeDependecies() async {
  injectore.registerSingleton<Dio>(
    dioServices(),
  );

  injectore.registerSingleton<AuthLocale>(
    AuthLocale(),
  );

  injectore.registerSingleton<AuthRemote>(
    AuthRemote(
      injectore()
    ),
  );

  injectore.registerSingleton<UserLocale>(
    UserLocale(
    ),
  );

  injectore.registerSingleton<UserRemote>(
    UserRemote(
        injectore()
    ),
  );

  inisializeAuthDependencies(injectore);
  inisializeUserManagementDependencies(injectore);
}
