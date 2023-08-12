import 'package:get/get.dart';
import 'package:tonjoo/module/user_management/presentation/list/controller/user_management_list_controller.dart';

class UserManagementListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserManagementListController());
  }
}