
import 'package:bugetmanagement/Model/Expence.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  Database? _database = null;
 
  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "sqliteExample.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE expense (id INTEGER PRIMARY KEY autoincrement, name TEXT,category TEXT, cost REAL)",
          );
        });
    return _database;
  }
 
  Future<int?> insertData(Expense model) async {
    await openDb();
int? a= await _database?.insert('person', model.toJson());
    return a;
  }
 
  Future<List<Expense>> getDataList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database!.rawQuery('SELECT * FROM person');
 
    return List.generate(maps.length, (i) {
      return Expense(
          name: maps[i]['name'],
          category: maps[i]['category'],
          cost: double.parse(maps[i]['cost']) );
    });
  }
 
  // Future<int> updateData(Expense model) async {
  //   await openDb();
  //   return await _database!.update('person', model.toJson(),
  //       where: "id = ?", whereArgs: [model.id]);
  // }
 
  // Future<void> deleteData(Expense model) async {
  //   await openDb();
  //   await _database!.delete('person', where: "id = ?", whereArgs: [model.id]);
  // }
}