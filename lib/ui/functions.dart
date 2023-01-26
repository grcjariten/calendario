import 'package:calendario/utils/settings.dart';
import 'package:flutter/material.dart';
import 'databasehelper.dart';
import 'objects.dart';

FloatingActionButton floatingButton(DateTime? selectedDay) {
  return FloatingActionButton(
    backgroundColor: floatingColor,
child: const Text("+"),
      onPressed: () {
        // insertZucchini(selectedDay);
        //TODO: Put here a form to add elements
      }
  );
}



List<Item> getEventsForDay(DateTime day, List<Item> items) {
List<Item> events = [];
  for (var element in items) {
    if(element.dateTime ==  day) {
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
    Item(element, element.foodValue, foodColor, element.dateTime)
  );}
  for (var element in moods) {newList.add(
      Item(element, element.moodValue.toString(), moodColor, element.dateTime)
  );}
  for (var element in stools) {newList.add(
      Item(element, element.stoolValue.toString(), stoolColor, element.dateTime)
  );}
  return newList;
}



