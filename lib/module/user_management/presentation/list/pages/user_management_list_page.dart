import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/widgets/inputs/tj_search_input.dart';
import 'package:tonjoo/module/user_management/presentation/list/controller/user_management_list_controller.dart';
import 'package:tonjoo/module/user_management/presentation/list/widgets/user_management_tile.dart';

class UserManagementListPage extends GetView<UserManagementListController> {
  const UserManagementListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List User')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            child: TjSearchInput(
              hints: "Search",
              onChanged: controller.search,
            ),
          ),
          Expanded(child: Obx(() {
            return ListView.builder(
                itemCount: controller.getUser().length,
                itemBuilder: (context, index) {
                  final data = controller.getUser()[index];
                  return UserManagementTile(
                    data: data,
                    onDelete: () {
                      Get.defaultDialog(
                          title: "Confirm",
                          middleText: "Delete this data?",
                          textConfirm: "Delete",
                          buttonColor: TjColors.dangerMain,
                          confirmTextColor: Colors.white,
                          cancelTextColor: TjColors.neutral90,
                          onConfirm: () async{
                            Get.back();
                            await controller.delete(data);

                          },
                          onCancel: ()  {

                            Get.back();
                          });
                    },
                  );
                });
          }))
        ],
      ),
    );
  }
}
