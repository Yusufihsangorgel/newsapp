import 'package:newsapp/app/feature/pages/login/model/userModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperLogin {
  static Database? _database;
  final String _usersTable = "usersNewsLoginTable";
  final String _isLogin = "isLogin";
  final String _username = "username";
  final String _password = "password";
  final String _nameSurname = "NameSurname";
  final String _phoneNumber = "phoneNumber";

  @override
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    } else {}
    return _database;
  }


  @override
   Future<Database> initializeDatabase() async {
    String databasePath =
        join(await getDatabasesPath(), "$_usersTable.db");
    var userDatabase =
        await openDatabase(databasePath, version: 1, onCreate: createDatabase);
    return userDatabase;
  }
  //tablo olusturma
  @override
  void createDatabase(Database database, int version) async {
    await database.execute(
        "Create table  $_usersTable ($_isLogin text ,  $_username text, $_password text, $_nameSurname text,$_phoneNumber text)");
  }


  Future<List<UserLogin>> getUsers() async {
    print("çalıştım");
    Database? database = await this.database;
    var result = await database?.query(_usersTable);
    print("buyur knk " + result.toString());
    return List.generate(result!.length, (index) {

      return UserLogin.fromMap(result[index]);
    });
  }


  Future<UserLogin?> getLoginUser(String email, String password) async {
    var dbClient = await database;
    var res = await dbClient!.rawQuery("SELECT * FROM $_usersTable WHERE "
        "$_username = '$email' AND "
        "$_password = '$password'");

    if (res.length > 0) {
      return UserLogin.fromMap(res.first);
    }

    return null;
  }


  @override
  Future insert(UserLogin user) async {
    Database? database = await this.database;
    var result = await database!.insert(_usersTable, user.toMap());
    return result;
  }


  @override
  Future update(UserLogin user) async {
    Database? database = await this.database;
    var result = await database!.update(_usersTable, user.toMap());
    return result;
  }


  @override
  Future delete(int id) async {
    Database? database = await this.database;
    var result =
        await database!.rawDelete("delete from $_usersTable where id = $id ");
  }
}