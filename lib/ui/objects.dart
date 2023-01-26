
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Food {
  String foodValue;
  DateTime dateTime;
  int? id;


  Food(
    this.foodValue,
    this.dateTime,
    [this.id]
);

  Map<String, dynamic> toMap() {
    return {
      "foodValue" : foodValue,
      "dateTime" : dateTime.toString(),
      "id" : id,
    };
  }
}

class Stool {
  int stoolValue;
  DateTime dateTime;
  int? id;


  Stool(
      this.stoolValue,
      this.dateTime,
      [this.id]
      );

  Map<String, dynamic> toMap() {
    return {

      "stoolValue" : stoolValue,
      "dateTime" : dateTime,
      "id" : id,
    };
  }
}

class Mood {

  int moodValue;
  DateTime dateTime;
  int? id;


  Mood(
      this.moodValue,
      this.dateTime,
      [this.id]
      );

  Map<String, dynamic> toMap() {
    return {
      "moodValue" : moodValue,
      "dateTime" : dateTime,
      "id" : id,
    };
  }
}

class Item {
  Object element;
  String tileTitle;
  Color tileColor;
  DateTime dateTime;

  Item(this.element, this.tileTitle, this.tileColor, this.dateTime);
}

// CalendarFormat calendarFormat,
//
//     DateTime? selectedDay,
// DateTime focusedDay,
//     List<Item> items,
//
// Function onDaySelectedCallback, //set a selectedDay
//     Function formatChangedCallback, //change the calendar format
// Function onPageChangedCallback, //set a different focusDay
// ) {

// format, day, day, callback, callback, callback

class CalendarInfo {
  DateTime focusedDay, selectedDay;
  CalendarFormat format;
  Function onDaySelectedCallback;
  Function formatChangedCallback;
  Function onPageChangedCallback;

  CalendarInfo(
      this.focusedDay, this.selectedDay, this.format,
      this.onDaySelectedCallback,
      this.formatChangedCallback,
      this.onPageChangedCallback,
      );
}
