import 'package:calendario/calendar.dart';
import 'package:flutter/material.dart';
import 'ui/functions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDay;

  DateTime _focusedDay = DateTime.now();

  callback(DateTime selected, DateTime focused) {
    setState(() {
      _selectedDay = selected;
      _focusedDay = focused;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[300],
      floatingActionButton: calendarButton(),
      body: Column(
        children: [
          myCalendar(_selectedDay, _focusedDay, callback),
        ],
      ),
    );
  }
}