import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:tonjoo/core/enums/gender.dart';
import 'package:tonjoo/core/utils/tj_icons.dart';
import 'package:tonjoo/core/widgets/buttons/tj_button_primary.dart';
import 'package:tonjoo/core/widgets/inputs/tj_dropdown_input.dart';
import 'package:tonjoo/core/widgets/inputs/tj_email_input.dart';
import 'package:tonjoo/core/widgets/inputs/tj_name_input.dart';
import 'package:tonjoo/core/widgets/tj_card_shadow.dart';
import 'package:tonjoo/module/user_management/presentation/form/controllers/user_management_form_controller.dart';

class UserManagementFormPage extends GetView<UserManagementFormController> {
  const UserManagementFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create User')),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TjCardShadow(
                    body: Column(
                      children: [
                        TjNameInput(
                          label: "First Name",
                          prefixIcon: const Icon(Icons.person),
                          controller: controller.firstName,
                          validator: ValidationBuilder().required().build(),
                        ),
                        TjNameInput(
                          label: "Last Name",
                          prefixIcon: const Icon(Icons.person),
                          controller: controller.lastName,
                          validator: ValidationBuilder().required().build(),
                        ),
                        Obx(() {
                          return TjDropdownInput<Gender>(
                            label: "Gender",
                            selectedValue: controller.selectedGender.value,
                            onChanged: controller.changeGender,
                            items: Gender.values
                                .map((Gender item) =>
                                DropdownMenuItem<Gender>(
                                  value: item,
                                  child: Text(
                                    item.name,
                                  ),
                                ))
                                .toList(),
                          );
                        }),
                        TjEmailInput(
                          label: "Email",
                          controller: controller.email,
                          validator: ValidationBuilder().required()
                              .email()
                              .build(),
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              SizedBox(
                                height: 100.h,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        OutlinedButton.icon(
                                          onPressed: () {
                                            controller.pickGallery();
                                            Get.back();
                                          },
                                          icon: Icon(Icons.image),
                                          label: Text("Gallery"),

                                        ),
                                        OutlinedButton.icon(
                                          onPressed: () {
                                            controller.pickCamera();
                                            Get.back();
                                          },
                                          icon: Icon(Icons.camera_alt),
                                          label: Text("Camera"),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                          child: Obx(() {
                            return SizedBox(
                              width: 0.5.sw,
                              height: 0.5.sw,
                              child: controller.file.value == null
                                  ? Image.asset(
                                TjIcons.noAvatar,
                                fit: BoxFit.cover,
                              )
                                  : Image.file(
                                File(controller.file.value!.path),
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                        )
                      ],
                    )),
                SizedBox(
                  height: 50.h,
                ),
                TjButtonPrimary(
                  label: "Submit",
                  onPressed: controller.submit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
