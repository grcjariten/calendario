
import 'package:flutter/material.dart';

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