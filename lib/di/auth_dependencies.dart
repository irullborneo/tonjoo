import 'package:get_it/get_it.dart';
import 'package:tonjoo/module/auth/data/repositories/auth_repository_impl.dart';
import 'package:tonjoo/module/auth/domain/repositories/auth_repository.dart';
import 'package:tonjoo/module/auth/domain/use_cases/checked_auth_usecase.dart';
import 'package:tonjoo/module/auth/domain/use_cases/login_usecase.dart';
import 'package:tonjoo/module/auth/domain/use_cases/logout_usecase.dart';

Future<void> inisializeAuthDependencies(GetIt injectore) async {
  injectore.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      injectore(),
      injectore(),
          injectore(),
    ),
  );

  injectore.registerLazySingleton<LoginUsecase>(
        () => LoginUsecase(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<CheckedAuthUsecase>(
        () => CheckedAuthUsecase(
      injectore(),
    ),
  );
  injectore.registerLazySingleton<LogoutUsecase>(
        () => LogoutUsecase(
      injectore(),
    ),
  );

}