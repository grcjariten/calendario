
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/settings.dart';

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
  Color? tileColor;
  DateTime dateTime;


  Item(this.element, this.tileTitle, this.tileColor, this.dateTime);

  String filterTitle() {
    Object object= element;
    if (object is Mood) {
      int value = object.moodValue;
      if(value < 6) return moodLow;
      if(value >= 6 && value < 8) return moodMedium;
      if(value >= 8) return moodHigh;
    }
    else if (object is Stool) {
      int value = object.stoolValue;
      if(value < 6) return stoolLow;
      if(value >= 6 && value < 8) return stoolMedium;
      if(value >= 8) return stoolHigh;
    }
    else if(object is Food) {
      return object.foodValue;
    }
    return "error";
  }


}

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
