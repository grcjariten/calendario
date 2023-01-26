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


// TODO: Here you'll probably have different kind of lists as parameters and show them as 3 lists (if 1 is null you don't show it)
List<Item> getEventsForDay(DateTime day, List<Item> items) {
List<Item> events = [];
  for (var element in items) {
    if(element.dateTime ==  day) {
      events.add(element);
    }
  }
  return events;
}



//This will create the list from _selectedEvents
Widget buildList(List<Item> events, BuildContext context) {
  print("Generating a list, starting with ${events.length} elements");

      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, index) {

          return Container(
            color: events[index].tileColor,
            child: ListTile(
              title: Text(events[index].tileTitle),
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () async {
                // callback(events, index); //this is just a temporary function
                // Food(3, "Peperonata", DateTime.parse("2023-01-18 00:00:00.000Z")),
                // await _db.insertFood(
                //     Food(3, "Peperonata", DateTime.parse("2023-01-18 00:00:00.000Z"),
                // )); //TODO: Delete this garbage once you've done.
                print("Insert something here");

              },
            ),
            ),
          );
        },
      );
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
