import 'package:calendario/calendar.dart';
import 'package:calendario/ui/databasehelper.dart';
import 'package:flutter/material.dart';
import 'ui/functions.dart';
import 'package:table_calendar/table_calendar.dart';
import 'ui/objects.dart';





class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  List _filteredEvents = [];
  DatabaseHelper db = DatabaseHelper();
  List<Food> foods = [];

  // //TODO: TEMPORARY to change the food list (creating a local db)
  // _selectedAddCallback(List events, int index) {
  //   setState(() {
  //     events[index].foodValue = "Carrots";
  //   });
  // }

  //Changing the day selected
  _selectedDayCallback(DateTime selected, DateTime focused) {
    setState(() {
      _selectedDay = selected; //select the day
      _focusedDay = focused;
      _filteredEvents = getEventsForDay(selected, foods); // gets the daily events and create a list
    });
    print(selected);
  }
  //Changing the calendar format
  _formatChangedCallback(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }
  //Changing the format preventing to reset to the initial page everytime you rebuild the interface
  _onPageChangedCallback(DateTime newMonth) {
    _focusedDay = newMonth;
  }

  _insertZucchini(DateTime selected) {
    print(1);
    Food zucchini = Food("zucchini", selected);
    zucchini.foodValue = "zucchini";
    zucchini.dateTime = selected;
    setState(() {
      print(2);

      db.insertFood(zucchini).then((newId) {
        zucchini.id = newId;
        print("zucchini was inserted in the database with the id: $newId");
      }

      );
    });
  }

  @override
  void didChangeDependencies() async {
    foods = await db.fetchFoods();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[300],
      floatingActionButton: calendarButton(_selectedDay, _insertZucchini),
      body: Column(
        children: [
          myCalendar(_calendarFormat, _selectedDay, _focusedDay, foods, _selectedDayCallback, _formatChangedCallback, _onPageChangedCallback),
          const SizedBox(height: 8.0),
          buildList(_filteredEvents, context)
        ],
      ),
    );
  }
}