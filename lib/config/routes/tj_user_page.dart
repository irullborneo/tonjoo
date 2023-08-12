import 'package:get/get.dart';
import 'package:tonjoo/config/routes/tj_routes.dart';
import 'package:tonjoo/module/user_management/presentation/index.dart';

List<GetPage> tjUserPage() => <GetPage>[
  GetPage(
    name: TjRoutes.USER_LIST,
    page: () => const UserManagementListPage(),
    binding: UserManagementListBinding(),
  ),

  GetPage(
    name: TjRoutes.USER_CREATE,
    page: () => const UserManagementFormPage(),
    binding: UserManagementFormBinding(),
  ),
];