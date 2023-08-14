import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/core/services/alert_service.dart';
import 'package:tonjoo/core/usecase/usecase.dart';
import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/add_all_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/count_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/get_user_locale_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/get_user_remote_usecase.dart';
import 'package:tonjoo/module/user_management/domain/use_cases/remove_user_locale_usecase.dart';

class UserManagementListController extends GetxController {
  final GetUserLocaleUsecase _locale = GetIt.I();
  final GetUserRemoteUsecase _remote = GetIt.I();
  final AddAllUserLocaleUsecase _addAll = GetIt.I();
  final RemoveUserLocaleUsecase _remove = GetIt.I();
  final CountUserLocaleUsecase _count = GetIt.I();
  final RxString _searchData = ''.obs;

  final RxList<UserEntity> _localUser = <UserEntity>[].obs;

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
    final res = await _count.call(NoParams());
    int count = 0;
    res.fold(
        (l) => AlertService(title: "Warning", message: "Something went wrong")
            .showWarning(),
        (r) => count = r);
    if (count == 0) {
      final list = await _initRemoteData();
      await _initAddAllDataLocale(list);
    }

    await _initLocalData();

    await EasyLoading.dismiss();
  }

  Future<void> _initAddAllDataLocale(List<UserModel> data) async {
    final res = await _addAll.call(data);
    res.fold(
        (l) => AlertService(title: "Warning", message: "Something went wrong")
            .showWarning(),
        (r) => null);
  }

  void search(String value) async {
    _searchData.value = value;
    await _initLocalData();
  }

  Future<void> _initLocalData() async {
    final res = await _locale.call(ListSchema(
        limit: 50, offset: _localUser.length, query: _searchData.value));
    res.fold((l) => null, (r) => _localUser.addAll(r));
  }

  Future<List<UserModel>> _initRemoteData() async {
    List<UserModel> lists = [];
    final res = await _remote.call(const ListSchema(limit: 50, offset: 0));
    res.fold(
        (l) => AlertService(title: "Warning", message: l.message).showWarning(),
        (r) => lists.addAll(r));
    return lists;
  }

  List<UserEntity> getUser() {
    return _localUser;
  }

  Future<void> delete(UserEntity data) async {
    if (data.id == null) {
      AlertService(title: "Warning", message: "Data cannot delete")
          .showWarning();
      return;
    }
    final res = await _remove.call(data.id!);
    res.fold(
        (l) => AlertService(title: "Warning", message: l.message).showWarning(),
        (r) {
      _localUser.removeWhere((element) => element.id == data.id);
      AlertService(title: "Success", message: r.message).showSuccess();
    });
  }
}
