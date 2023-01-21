import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'objects.dart';

class DatabaseHelper {


  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join( path, "events_database.db"),
      onCreate: (db, int version) {
        db.execute(
            'CREATE TABLE foods(id INTEGER PRIMARY KEY, foodValue TEXT, datetime TEXT)'
        );
        db.execute(
            'CREATE TABLE moods(id INTEGER PRIMARY KEY, moodValue TEXT, datetime TEXT)'
        );
        db.execute(
            'CREATE TABLE stools(id INTEGER PRIMARY KEY, stoolValue TEXT, datetime TEXT)'
        );
      },
      version: 1,
    );
  }


  Future<void> insertFood(Food food) async {
    final Database db = await initDb();
      await db.insert(
          'foods', food.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
      print("${food.foodValue} was successfully inserted in the db!");
    }

  Future<List<Food>> fetchFoods() async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('foods');
    
    return List.generate(maps.length, (i) {
      return Food(
        maps[i]['id'],
        maps[i]['foodValue'],
        DateTime.parse(maps[i]['datetime'])
      );
    });
  }

}





