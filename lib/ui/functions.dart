import 'package:flutter/material.dart';
import 'objects.dart';

FloatingActionButton calendarButton() {
  return FloatingActionButton(
      onPressed: () {}
  );
}


// TODO: Here you'll probably have different kind of lists as parameters and show them as 3 lists (if 1 is null you don't show it)
List<Food> getEventsForDay(DateTime day, List<Food> foods) {
List<Food> events = [];
  for (var element in foods) {
    if(element.dateTime ==  day) {
      events.add(element);
    }
  }
  return events;
}



//This will create the list from _selectedEvents
Widget buildList(List<dynamic> events, BuildContext context, Function callback) {


      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(events[index].foodValue),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              // callback(events, index); //this is just a temporary function
              // Food(3, "Peperonata", DateTime.parse("2023-01-18 00:00:00.000Z")),
              // await _db.insertFood(
              //     Food(3, "Peperonata", DateTime.parse("2023-01-18 00:00:00.000Z"),
              // )); //TODO: Delete this garbage once you've done.

            },
          ),
          );
        },
      );
}
