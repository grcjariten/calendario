import 'package:flutter/material.dart';
import '../utils/database_helper.dart';
import '../utils/objects.dart';
import '../utils/settings.dart';

List<Item> getEventsForDay(DateTime day, List<Item> items) {
  List<Item> events = [];
  for (var element in items) {
    if(element.date() ==  day) {
      events.add(element);
    }
  }
  return events;
}


Future<List<Item>> fetchingItems() async {
  DatabaseHelper db = DatabaseHelper();
  List<Food> foods = await db.fetchFoods();
  List<Mood> moods = await db.fetchMoods();
  List<Stool> stools = await db.fetchStools();

  List<Item> newList = [];
  for (var element in foods) {newList.add(
      Item(element, element.foodValue, foodColor)
  );}
  for (var element in moods) {newList.add(
      Item(element, element.moodValue.toString(), moodColor)
  );}
  for (var element in stools) {newList.add(
      Item(element, element.stoolValue.toString(), stoolColor)
  );}
  debugPrint("Items successfully fetched from the database.");
  return newList;
}





