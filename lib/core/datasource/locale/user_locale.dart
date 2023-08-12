import 'package:get_storage/get_storage.dart';
import 'package:tonjoo/core/constants/storage_key_constant.dart';
import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';

abstract class UserLocale {
  factory UserLocale() = _UserLocale;
  List<UserEntity> getList();
  void add(UserModel user);
  void removeAt(int index);
}

class _UserLocale implements UserLocale {
  final _key = StorageKeyConst.userList;
  final _storage = GetStorage();

  @override
  void add(UserModel user) {
    List raw = _storage.read<List>(_key) ?? [];
    raw.add(user.toJson());
    _storage.write(
      _key,
      raw,
    );
  }

  @override
  List<UserEntity> getList() {
    final List list = _storage.read<List>(_key) ?? [];
    return list.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  void removeAt(int index) {
    List raw = _storage.read(_key) ?? [];
    raw.removeAt(index);
    _storage.write(
      _key,
      raw,
    );
  }
}
