import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';
import 'package:tonjoo/core/widgets/buttons/tj_button_danger.dart';
import 'package:tonjoo/module/home/presentation/controllers/logout_controller.dart';

class LogoutPage extends GetView<LogoutController> {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Logout now?', style: TjStyles.header,),
          SizedBox(height: 20.h,),
          SizedBox(
            width: 200.w,
            child: TjButtonDanger(
              label: "Iya",
              onPressed: controller.logout,
            ),
          )
        ],
      );
  }
}