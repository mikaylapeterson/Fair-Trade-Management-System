import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fairtrade_certification_management_system/Models/user.dart';

class DatabaseHelper {
  final databaseName = "fairtrade.db";

  // create Tables here
  String userTable = 
    "CREATE TABLE User (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";

  Future<Database> initDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(userTable);
    });
  }

  // Login Method
  Future<bool> login(User user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "select * from User where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> signup(User user) async {
    final Database db = await initDB();

    return db.insert('User', user.toMap());
  }
}