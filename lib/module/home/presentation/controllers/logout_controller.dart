import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tonjoo/config/routes/tj_routes.dart';
import 'package:tonjoo/core/services/alert_service.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/auth/domain/use_cases/logout_usecase.dart';

class LogoutController extends GetxController {
  final LogoutUsecase _logout = GetIt.I();

  void logout() async {
    await EasyLoading.show();
    final res = await _logout.call(NoParams());
    await EasyLoading.dismiss();
    res.fold(
        (l) =>
            AlertService(title: "Peringatan", message: l.message).showWarning(),
        (r) {
      Get.offAllNamed(TjRoutes.LOGIN);
      AlertService(title: "Logout", message: r.message).showSuccess();
    });
  }
}
