import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/core/services/alert_service.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/get_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/get_user_remote_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/remove_user_locale_usecase.dart';

class UserManagementListController extends GetxController {
  final GetUserLocaleUsecase _locale = GetIt.I();
  final GetUserRemoteUsecase _remote = GetIt.I();
  final RemoveUserLocaleUsecase _remove = GetIt.I();
  final RxString _searchData = ''.obs;

  final RxList<UserEntity> _localUser = <UserEntity>[].obs;
  final RxList<UserEntity> _remoteUser = <UserEntity>[].obs;

  @override
  void onInit() {
    _initData();
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

  void _initData() async {
    await EasyLoading.show();
    await _initLocalData();
    await _initRemoteData();
    await EasyLoading.dismiss();
  }

  void search(String value) async {
    _searchData.value = value;
  }

  Future<void> _initLocalData() async {
    final res = await _locale.call(NoParams());
    res.fold((l) => null, (r) => _localUser.addAll(r));
  }

  Future<void> _initRemoteData() async {
    final res =
        await _remote.call(ListSchema(limit: 50, offset: _remoteUser.length));
    res.fold(
        (l) => AlertService(title: "Warning", message: l.message).showWarning(),
        (r) => _remoteUser.addAll(r));
  }

  List<UserEntity> getUser() {
    List<UserEntity> data = [];
    data.addAll(_localUser);
    data.addAll(_remoteUser);

    return data
        .where((element) => element.fullName().toLowerCase().contains(_searchData.value.toLowerCase()))
        .toList();
  }

  Future<void> delete(UserEntity data) async {
    if (data.id == null) {
      int index = _localUser.indexWhere((element) =>
          (element.email == data.email && element.firstName == data.firstName));
      final res = await _remove.call(index);
      res.fold(
          (l) =>
              AlertService(title: "Warning", message: l.message).showWarning(),
          (r) {
        _localUser.removeAt(index);
        AlertService(title: "Success", message: r.message).showSuccess();
      });
    } else {
      int index = _remoteUser.indexWhere((element) => element.id == data.id);
      _remoteUser.removeAt(index);
    }
  }
}
