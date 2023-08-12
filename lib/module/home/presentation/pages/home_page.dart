import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';
import 'package:tonjoo/module/home/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => controller.initialRoute.value.length > 1
            ? Navigator(
          key: Get.nestedKey(1),
          initialRoute: controller.initialRoute.value,
          onGenerateRoute: controller.onGenerateRoute,
        )
            : const SizedBox(),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: TjColors.mainColor,
unselectedItemColor: TjColors.neutral50,
            selectedItemColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20.sp,
                  color: TjColors.neutral50,
                ),
                activeIcon: Icon(
                  Icons.home,
                  size: 20.sp,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add,
                  size: 20.sp,
                  color: TjColors.neutral50,
                ),
                activeIcon: Icon(
                  Icons.person_add,
                  size: 20.sp,
                  color: Colors.white,
                ),
                label: 'Create',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.logout,
                  size: 20.sp,
                  color: TjColors.neutral50,
                ),
                activeIcon: Icon(
                  Icons.logout,
                  size: 20.sp,
                  color: Colors.white,
                ),
                label: 'Logout',
              ),
            ],
            currentIndex: controller.currentIndex.value,

            onTap: controller.changePage,
            ),
      ),
    );
  }
}