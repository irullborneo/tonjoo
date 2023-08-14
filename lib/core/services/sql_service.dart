import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tonjoo/core/databases/user_db.dart';

class SqlService {
  static late final Database database;

  Future<void> init() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'tonjoo.db'),
      onCreate: (db, version) {
        if (version == 1) {
          db.execute(
            '''
              CREATE TABLE ${UserDB.tableName}(
                ${UserDB.idField} TEXT PRIMARY KEY, 
                ${UserDB.firstNameField} TEXT, 
                ${UserDB.lastNameField} TEXT, 
                ${UserDB.avatarField} TEXT, 
                ${UserDB.emailField} TEXT, 
                ${UserDB.genderField} TEXT
              )
            ''',
          );
        }
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}