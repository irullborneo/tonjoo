import 'package:get/get.dart';
import 'package:tonjoo/module/user_management/presentation/form/controllers/user_management_form_controller.dart';

class UserManagementFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserManagementFormController());
  }
}