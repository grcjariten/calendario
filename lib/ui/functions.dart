import 'package:flutter/material.dart';
import 'objects.dart';

FloatingActionButton calendarButton() {
  return FloatingActionButton(
      onPressed: () {}
  );
}


// Here you'll probably choose to create a more general list, not just <Food>
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
            onPressed: () {
              callback(events, index);
            },
          ),
          );
        },
      );
}
