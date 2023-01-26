import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//Calendar settings
DateTime defaultFirstDay = DateTime.utc(2021, 01, 16);
DateTime defaultLastDay = DateTime.utc(2040, 01, 16);
DateTime today = DateTime.now(); //Initial Value for focusDay in home.dart
CalendarFormat defaultFormat= CalendarFormat.twoWeeks;

//Colors
Color? backgroundColor = Colors.white;
Color foodColor = Colors.green;
Color moodColor = Colors.redAccent;
Color stoolColor = Colors.brown;
Color floatingColor = Colors.indigo;
