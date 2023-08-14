import 'package:get_it/get_it.dart';
import 'package:tonjoo/module/user_management/data/repositories/user_repository_impl.dart';
import 'package:tonjoo/module/user_management/domain/repositories/user_repository.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/add_all_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/add_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/count_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/get_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/get_user_remote_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/remove_user_locale_usecase.dart';

Future<void> inisializeUserManagementDependencies(GetIt injectore) async {
  injectore.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
      injectore(),
      injectore(),
    ),
  );

  injectore.registerLazySingleton<RemoveUserLocaleUsecase>(
        () => RemoveUserLocaleUsecase(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<GetUserRemoteUsecase>(
        () => GetUserRemoteUsecase(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<GetUserLocaleUsecase>(
        () => GetUserLocaleUsecase(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<AddUserLocaleUsecase>(
        () => AddUserLocaleUsecase(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<CountUserLocaleUsecase>(
        () => CountUserLocaleUsecase(
      injectore(),
    ),
  );

  injectore.registerLazySingleton<AddAllUserLocaleUsecase>(
        () => AddAllUserLocaleUsecase(
      injectore(),
    ),
  );


}