import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//Calendar settings
DateTime defaultFirstDay = DateTime.utc(2021, 01, 16);
DateTime defaultLastDay = DateTime.utc(2040, 01, 16);
DateTime today = DateTime.now(); //Initial Value for focusDay in home.dart
CalendarFormat defaultFormat= CalendarFormat.twoWeeks;

//Colors
Color? backgroundColor = Colors.white;
Color? foodColor = Colors.green[200];
Color? moodColor = Colors.blue[100];
Color? stoolColor = Colors.brown[200];
Color insertFloatingFoodColor = Colors.green;
Color insertFloatingMoodColor = Colors.indigo;
Color insertFloatingStoolColor = Colors.brown;
Color foodPageAppBarColor = insertFloatingFoodColor;
Color moodPageAppBarColor = insertFloatingMoodColor;
Color stoolPageAppBarColor = insertFloatingStoolColor;

//Value ouput
String stoolLow = "Cacca dappertutto";
String stoolMedium = "Sto bene";
String stoolHigh = "Merdaviglia!";
String moodLow = "Sto male";
String moodMedium = "Non c'è male";
String moodHigh = "Sto da Dio";