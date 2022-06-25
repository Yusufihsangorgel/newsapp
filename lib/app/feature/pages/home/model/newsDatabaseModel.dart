import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperNews {
  static Database? _database;
  final String _db = "usersNewsLoginTable";
  final String _tableName = "newsTable";
  final String _title = "isLogin";
  final String _link = "link";
  final String _cleanUrl = "cleanurl";
  final String _summary = "password";
  final String _media = "NameSurname";
  final String _id = "id";

  @override
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    } else {}
    return _database;
  }

  @override
  Future<Database> initializeDatabase() async {
    String databasePath = join(await getDatabasesPath(), "$_db.db");
    var userDatabase =
        await openDatabase(databasePath, version: 1, onCreate: createDatabase);
    return userDatabase;
  }

  //tablo olusturma
  @override
  void createDatabase(Database database, int version) async {
    await database.execute(
        "Create table  $_tableName ($_title text ,  $_link text, $_cleanUrl text, $_summary text, $_media text, $_id text)");
  }

  Future<List<News>> getNewsDb() async {
    print("çalıştım");
    Database? database = await this.database;
    var result = await database?.query(_tableName);
    print("buyur knk " + result.toString());
    return List.generate(result!.length, (index) {
      return News.fromMap(result[index]);
    });
  }

  @override
  Future insert(News news) async {
    Database? database = await this.database;
    var result = await database!.insert(_tableName, news.toMap());
    return result;
  }

  // @override
  // Future update(News news) async {
  //   Database? database = await this.database;
  //   var result = await database!.update(_tableName, news.toMap());
  //   return result;
  // }

  @override
  Future delete(String id) async {
    Database? database = await this.database;
    var result = await database!.rawDelete("DELETE FROM $_tableName WHERE "
        "$_id = '$id'");
        return result;
  }

  // Future<int> deleteUser(String id) async {
  //   Database? database = await this.database;
  //   var res = await database!
  //       .delete(_tableName, where: '$_id = ?', whereArgs: [id]);
  //   return res;
  // }
}
