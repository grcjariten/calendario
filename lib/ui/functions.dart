import 'package:flutter/material.dart';
import 'objects.dart';

FloatingActionButton calendarButton() {
  return FloatingActionButton(
      onPressed: () {}
  );
}

List<Food> foods= [
  Food(1, "Banana e Mango", DateTime.parse("2023-01-18 00:00:00.000Z")),
  Food(2, "Beans", DateTime.parse("2023-01-18 00:00:00.000Z")),
];

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



