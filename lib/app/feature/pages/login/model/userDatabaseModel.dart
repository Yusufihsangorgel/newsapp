
import 'package:newsapp/app/feature/pages/login/model/userModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelperLogin {
  static Database? _database;
  String usersTable = "usersLoginTableYusuf";
  String isLogin = "isLogin";
  String username = "username";
  String password = "password";
  String nameSurname = "NameSurname";
  String phoneNumber = "phoneNumber";
//database kontrol
  Future<Database?> get database async {
    if (database == null) {
      _database = await initializeDatabase();
    } else {}
    return database;
  }

  //data path ve open data
  Future<Database> initializeDatabase() async {
    String databasePath =
        join(await getDatabasesPath(), "$usersTable.db");
    var userDatabase =
        await openDatabase(databasePath, version: 1, onCreate: createDatabase);
    return userDatabase;
  }

  //tablo olusturma
  void createDatabase(Database database, int version) async {
    await database.execute(
        "Create table  $usersTable ($isLogin text ,  $username text, $password text, $nameSurname text,$phoneNumber text)");
  }

  // tum userlari sorgulama
  Future<List<UserLogin>> getUsers() async {
    Database? database = await this.database;
    var result = await database?.query(usersTable);
    return List.generate(result!.length, (index) {
      return UserLogin.fromMap(result[index]);
    });
  }

//yeni verir atarken kullaniyoruz. Insert
  Future insert(UserLogin user) async {
    Database? database = await this.database;
    var result = await database!.insert(usersTable, user.toMap());
    return result;
  }

//Veri yenileme
  Future update(UserLogin user) async {
    Database? database = await this.database;
    var result = await database!.update(usersTable, user.toMap());
    return result;
  }

//veri silme
  Future delete(int id) async {
    Database? database = await this.database;
    var result =
        await database!.rawDelete("delete from $usersTable where id = $id ");
  }
}


