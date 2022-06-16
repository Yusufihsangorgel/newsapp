
import 'package:newsapp/app/core/database/databaseModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DatabaseProvider<T extends DatabaseModel> {
  Database? _database;
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    } else {}
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String databasePath = join(await getDatabasesPath(), "tabloadı.db");
    var userDatabase =
        await openDatabase(databasePath, version: 1, onCreate: createDatabase);
    return userDatabase;
  }

  void createDatabase(
    Database database,
    int version,
  ) async {
    await database.execute(""
        //  "Create table  $_usersTable ($_isLogin text ,  $_username text, $_password text)");
        );
  }

  Future<List<T?>> getUsers() async {
    Database? database = await this.database;
    var result = await database?.query("tableName");
    return List.generate(result!.length, (index) {
      return null;
      //return t.fromMap(result[index]); soru işaretini kaldır
    });
  }

  Future insert(T user) async {
    Database? database = await this.database;
    //var result = await database!.insert(_usersTable, user.toMap());
    return null;
  }

  Future update(T user) async {
    Database? database = await this.database;
    // var result = await database!.update(_usersTable, user.toMap());
    return null;
  }

//veri silme
  Future delete(int id) async {
    Database? database = await this.database;
    var result = await database!
        .rawDelete("delete from tabloadıbaşınadolar where id = $id ");
  }

  Future<void> close() async {
    await _database!.close();
  }
}
