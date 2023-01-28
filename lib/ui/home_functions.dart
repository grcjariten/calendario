import 'package:calendario/formPages/foodFormPage.dart';
import 'package:calendario/formPages/moodFormPage.dart';
import 'package:calendario/formPages/stoolFormPage.dart';
import 'package:calendario/utils/settings.dart';
import 'package:flutter/material.dart';
import 'databasehelper.dart';
import 'objects.dart';


FloatingActionButton insertFloating(ObjectType type, BuildContext context) {
  foodActionButton() {
    return FloatingActionButton(
        heroTag: "foodTag",
        backgroundColor: insertFloatingFoodColor,
        child: const Text("+\nFood", textAlign: TextAlign.center,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FoodFormPage()));
        }
    );
  }

  moodActionButton() {
    return FloatingActionButton(
      heroTag: "moodTag",
        backgroundColor: insertFloatingMoodColor,
        child: const Text("+\nMood", textAlign: TextAlign.center,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MoodFormPage()));
        }
    );
  }
  stoolActionButton() {
    return FloatingActionButton(
        heroTag: "stoolTag",
        backgroundColor: insertFloatingStoolColor,
        child: const Text("+\nStool", textAlign: TextAlign.center,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoolFormPage()));
        }
    );
  }

  if(type == ObjectType.food) {
      return foodActionButton();
  }
  else if(type == ObjectType.mood) {
      return moodActionButton();
  } else if(type == ObjectType.stool) {
      return stoolActionButton();
  }
  else {
return FloatingActionButton(onPressed: () {});
}
}

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
  return newList;
}





