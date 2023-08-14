import 'package:sqflite/sqflite.dart';
import 'package:tonjoo/core/databases/user_db.dart';
import 'package:tonjoo/core/schema/list_schema.dart';
import 'package:tonjoo/core/services/sql_service.dart';
import 'package:tonjoo/module/user_management/data/models/user_model.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';

abstract class UserLocale {
  factory UserLocale() = _UserLocale;
  Future<List<UserEntity>> fetch(ListSchema query);
  Future<void> insert(UserModel user);
  Future<void> insertAll(List<UserModel> users);
  Future<int> count();
  Future<void> delete(String index);
  Future<void> clear();
}

class _UserLocale implements UserLocale {
  final db = SqlService.database;

  @override
  Future<void> insert(UserModel user) async {
    Batch batch = db.batch();
    UserDB data = UserDB.fromUserModel(user);

    batch.insert(
      UserDB.tableName,
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await batch.commit(noResult: true);
  }

  @override
  Future<void> delete(String id) async {
    await db.delete(
      UserDB.tableName,
      where: '${UserDB.idField} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> insertAll(List<UserModel> users) async {
    Batch batch = db.batch();
    for (UserModel user in users) {
      UserDB data = UserDB.fromUserModel(user);
      batch.insert(
        UserDB.tableName,
        data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<List<UserEntity>> fetch(ListSchema schema) async {
    final List<Map<String, dynamic>>
    maps = await db.query(
      UserDB.tableName,
      where: '${UserDB.firstNameField} LIKE ?',
      whereArgs: ['%${schema.query}%'],
    );

    List<UserDB> list = List.generate(maps.length, (i) {
      return UserDB(
        id: maps[i][UserDB.idField],
        firstname: maps[i][UserDB.firstNameField],
        lastName: maps[i][UserDB.lastNameField],
        email: maps[i][UserDB.emailField],
        gender: maps[i][UserDB.genderField],
        avatar: maps[i][UserDB.avatarField],
      );
    });

    return list.map<UserEntity>((e) => UserEntity.fromLocale(e)).toList();
  }

  @override
  Future<int> count() async {
    int count = Sqflite.firstIntValue(
            await db.rawQuery('SELECT COUNT(*) FROM ${UserDB.tableName}')) ??
        0;
    return count;
  }

  @override
  Future<void> clear() async {
    await db.delete(
      UserDB.tableName,
    );
  }
}
