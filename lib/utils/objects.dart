import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/settings.dart';

enum ObjectType {
  food, mood, stool
}

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
      "date" : dateTime.toString(),
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
      "date" : dateTime.toString(),
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
      "date" : dateTime.toString(),
      "id" : id,
    };
  }
}

class Item {
  Object element;
  String tileTitle;
  Color? tileColor;


  Item(this.element, this.tileTitle, this.tileColor);

  DateTime date() {
    Object object= element;
    if(object is Food) return object.dateTime;
    if(object is Mood) return object.dateTime;
    if(object is Stool) return object.dateTime;
    return today;
  }

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

  Color? filterColor() {
    Object object= element;
    if (object is Food){
      return foodColor;
    }
    else if (object is Mood){
      return moodColor;
    }
    else {
      return foodColor;
    }
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
