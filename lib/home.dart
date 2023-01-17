import 'package:calendario/calendar.dart';
import 'package:flutter/material.dart';
import 'ui/functions.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();

  _selectedDayCallback(DateTime selected, DateTime focused) {
    setState(() {
      _selectedDay = selected;
      _focusedDay = focused;
    });
  }

  _formatChangedCallback(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[300],
      floatingActionButton: calendarButton(),
      body: Column(
        children: [
          myCalendar(_calendarFormat, _selectedDay, _focusedDay, _selectedDayCallback, _formatChangedCallback),
        ],
      ),
    );
  }
}