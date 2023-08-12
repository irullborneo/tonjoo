import 'package:get/get.dart';
import 'package:tonjoo/module/auth/presentation/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}