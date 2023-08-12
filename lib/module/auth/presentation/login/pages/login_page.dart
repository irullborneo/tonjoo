import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';
import 'package:tonjoo/core/widgets/buttons/tj_button_primary.dart';
import 'package:tonjoo/core/widgets/inputs/tj_name_input.dart';
import 'package:tonjoo/core/widgets/inputs/tj_password_input.dart';
import 'package:tonjoo/core/widgets/tj_card_shadow.dart';
import 'package:tonjoo/module/auth/presentation/login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TjColors.background,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Text('Login', style: TjStyles.header),
                  SizedBox(
                    height: 50.h,
                  ),
                  TjCardShadow(
                      body: Column(
                    children: [
                      TjNameInput(
                        label: "username",
                        prefixIcon: const Icon(Icons.person),
                        controller: controller.username,
                        validator: ValidationBuilder().required().build(),
                      ),
                      TjPasswordInput(
                        label: 'password',
                        controller: controller.password,
                        validator: ValidationBuilder().required().build(),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Obx(() {
                    return TjButtonPrimary(
                      label: "Login",
                      onPressed:
                          controller.isOnline() ? controller.submit : null,
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
