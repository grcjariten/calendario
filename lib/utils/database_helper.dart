import 'package:flutter/cupertino.dart';
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
            'CREATE TABLE foods(id INTEGER PRIMARY KEY, foodValue TEXT, date TEXT)'
        );
        db.execute(
            'CREATE TABLE moods(id INTEGER, moodValue INTEGER, date TEXT PRIMARY KEY)'
        );
        db.execute(
            'CREATE TABLE stools(id INTEGER PRIMARY KEY, stoolValue INTEGER, date TEXT)'
        );
      },
      version: 1,
    );
  }

  Future<List<Food>> fetchFoods() async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('foods');

    return List.generate(maps.length, (i) {
      return Food(
        maps[i]['foodValue'],
        DateTime.parse(maps[i]['date']),
        maps[i]['id'],
      );
    });
  }
  Future<int> insertFood(Food food) async {
    final Database db = await initDb();
    int result = await db.insert(
        'foods', food.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    print("New Food:${food.foodValue} was successfully inserted in the "
        "db!");
    return result;
  }

  Future<List<Mood>> fetchMoods() async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('moods');

    return List.generate(maps.length, (i) {
      return Mood(
        maps[i]['moodValue'],
        DateTime.parse(maps[i]['date']),
        maps[i]['id'],
      );
    });
  }
  Future<int> insertMood(Mood mood) async {
    //TODO: Find a way to edit an item if it exists and insert a new one if
    // it doesn't.
    final Database db = await initDb();
    final List<Mood> moods = await fetchMoods();
    late Mood newMood;
    late int result;
    // moods[moods.indexWhere((element) => element.dateTime == dateTime)];
    for (var element in moods) {
      print("element: ${element.dateTime}");
      if(!(element.dateTime == mood.dateTime)) {
        print("found no items");
        newMood = Mood(mood.moodValue, element.dateTime);
        result = await db.insert(
            'moods', newMood.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      } else if(element.dateTime == mood.dateTime){
        print("found an item!");
        newMood = Mood(mood.moodValue, element.dateTime, element.id);
        result = await db.insert(
            'moods', newMood.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    print("New Mood:${mood.moodValue} was successfully inserted in the "
        "db!");
    return result;
  }

  Future<List<Stool>> fetchStools() async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('stools');

    return List.generate(maps.length, (i) {
      return Stool(
        maps[i]['stoolValue'],
        DateTime.parse(maps[i]['date']),
        maps[i]['id'],
      );
    });
  }
  Future<int> insertStool(Stool stool) async {
    final Database db = await initDb();
    int result = await db.insert(
        'stools', stool.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );

    print("New Stool:${stool.stoolValue}${stool.dateTime}${stool.id} was "
        "successfully inserted in the "
        "db!");
    return result;
  }


}


