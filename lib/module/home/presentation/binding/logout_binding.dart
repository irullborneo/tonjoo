import 'package:get/get.dart';
import 'package:tonjoo/module/home/presentation/controllers/logout_controller.dart';

class LogoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoutController());
  }
}