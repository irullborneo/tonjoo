import 'package:get/get.dart';
import 'package:tonjoo/config/routes/tj_routes.dart';
import 'package:tonjoo/core/params/nested_navigation_param.dart';
import 'package:tonjoo/module/home/presentation/index.dart';
import 'package:tonjoo/module/user_management/presentation/index.dart';

import 'tj_auth_page.dart';
import 'tj_user_page.dart';

class TjPages {
  static const initial = TjRoutes.LOGIN;

  static List<GetPage> getRoutes() {
    List<GetPage> routes = [];
    routes.add(GetPage(
      name: TjRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),);
    // routes.addAll(tjUserPage());
    routes.addAll(tjAuthPage());
    return routes;
  }

  static List<NestedNavigationParam> getNestedPage() {
    return [
      NestedNavigationParam(
        name: TjRoutes.USER_LIST,
        page: () => const UserManagementListPage(),
        binding: UserManagementListBinding(),
      ),
      NestedNavigationParam(
        name: TjRoutes.USER_CREATE,
        page: () => const UserManagementFormPage(),
        binding: UserManagementFormBinding(),
      ),
      NestedNavigationParam(
        name: TjRoutes.LOGOUT,
        page: () => const LogoutPage(),
        binding: LogoutBinding(),
      )
    ];
  }
}