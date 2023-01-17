import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

TableCalendar myCalendar(DateTime? selectedDay, DateTime? focusedDay, Function callback) {
  return TableCalendar(
    focusedDay: DateTime.now(),
    firstDay: DateTime.utc(2021, 01, 16),
    lastDay: DateTime.utc(2040, 01, 16),



//Questo aggiunge interattività al calendario:
  selectedDayPredicate:
      (day) {
    return isSameDay(selectedDay, day);
  }
  ,
  onDaySelected: (selected, focused) {
      callback(selected, focused);
  },
  );
}