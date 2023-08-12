import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tonjoo/core/enums/gender.dart';
import 'package:tonjoo/core/services/alert_service.dart';
import 'package:tonjoo/module/user_management/domain/schema/user_schema.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/add_user_locale_usecase.dart';

class UserManagementFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final Rx<Gender> selectedGender = Gender.male.obs;
  final Rxn<XFile> file = Rxn();

  final ImagePicker picker = ImagePicker();

  final AddUserLocaleUsecase _addLocale = GetIt.I();

  @override
  void onInit() {
    _refreshData();
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

  void changeGender(Gender? value) {
    if (value != null) {
      selectedGender.value = value;
    }
  }

  void submit() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    await EasyLoading.show();
    final res = await _addLocale.call(UserSchema(
        gender: selectedGender.value.name,
        email: email.text,
        lastName: lastName.text,
        path: file.value?.path,
        firstName: firstName.text));
    await EasyLoading.dismiss();
    res.fold(
        (l) =>
            AlertService(title: "Peringatan", message: l.message).showWarning(),
        (r) {
      AlertService(title: "Success", message: r.message).showSuccess();
      _refreshData();
    });
  }

  Future<void> pickGallery()async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    file.value = image;
  }

  Future<void> pickCamera()async{
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    file.value = image;

  }

  void _refreshData() {
    selectedGender.value = Gender.male;
    email.clear();
    firstName.clear();
    lastName.clear();
    email.clear();
    file.value = null;
  }
}
