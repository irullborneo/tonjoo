import 'package:tonjoo/core/constants/storage_key_constant.dart';
import 'package:tonjoo/core/models/auth_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class AuthLocale {
  factory AuthLocale() = _AuthLocale;
  AuthModel? getAuth();
  void setAuth(AuthModel auth);
  void removeAuth();
  Map<String, String> getHeader();
}

class _AuthLocale implements AuthLocale {
  final _key = StorageKeyConst.authKey;
  final _storage = GetStorage();

  @override
  AuthModel? getAuth() {
    final raw = _storage.read(_key);
    if (raw != null) {
      return AuthModel.fromJson(raw);
    }
    return null;
  }

  @override
  Map<String, String> getHeader() {
    final raw = _storage.read(_key);
    if (raw != null) {
      final auth = AuthModel.fromJson(raw);

      return {
        'Authorization': 'Bearer ${auth.token}',
        // 'grant': auth.grant,
      };
    }

    return {};
  }

  @override
  void removeAuth() {
    _storage.remove(_key);
  }

  @override
  void setAuth(AuthModel auth) {
    _storage.write(
      _key,
      auth.toJson(),
    );
  }
}