import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tonjoo/config/routes/tj_routes.dart';
import 'package:tonjoo/core/services/alert_service.dart';
import 'package:tonjoo/core/services/connectivity_service.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/auth/domain/schema/login_schema.dart';
import 'package:tonjoo/module/auth/domain/use_cases/checked_auth_usecase.dart';
import 'package:tonjoo/module/auth/domain/use_cases/login_usecase.dart';

class LoginController extends GetxController {
  final Rxn<Map> _source = Rxn();
  final formKey = GlobalKey<FormState>();

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final ConnectivityService _connectivity = ConnectivityService.instance;

  final LoginUsecase _login = GetIt.I();
  final CheckedAuthUsecase _checked = GetIt.I();

  @override
  void onInit() {
    _source.value = {ConnectivityResult.none: false};
    _checkedLogin();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      _source.value = source;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool isOnline() {
    return _source.value!.keys.toList()[0] != ConnectivityResult.none;
  }

  void _checkedLogin() async {
    final res = await _checked.call(NoParams());
    FlutterNativeSplash.remove();
    res.fold((l) => null, (r) {
      if (r) {
        Get.offAllNamed(TjRoutes.HOME);
      }
    });
  }

  void submit() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    await EasyLoading.show();
    final res = await _login
        .call(LoginSchema(user: username.text, password: password.text));

    await EasyLoading.dismiss();
    res.fold((l) async {
      AlertService(title: "Peringatan", message: l.message).showWarning();
    }, (r) {
      Get.offAllNamed(TjRoutes.HOME);
      AlertService(title: "Login Success", message: r.message).showSuccess();
    });
  }
}
