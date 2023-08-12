import 'package:get/get.dart';
import 'package:tonjoo/config/routes/tj_pages.dart';
import 'package:tonjoo/config/routes/tj_routes.dart';
import 'package:tonjoo/module/auth/presentation/index.dart';

List<GetPage> tjAuthPage() => <GetPage>[
  GetPage(
    name: TjRoutes.LOGIN,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
];