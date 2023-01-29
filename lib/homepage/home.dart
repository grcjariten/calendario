import '../home_ui/fetching_methods.dart';
import 'calendar.dart';
import 'package:flutter/material.dart';
import '../home_ui/build_list.dart';
import '../home_ui/home_widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/objects.dart';
import '../utils/settings.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDay = today, _focusedDay = today;
  CalendarFormat _format = defaultFormat;
  List<Item> _filteredItems = [], items = [];
  late CalendarInfo info;

  //Changing the day selected
  _onDaySelectedCallback(DateTime selected, DateTime focused) {
    setState(() {
      _selectedDay = selected; //select the day
      _focusedDay = focused;
      _filteredItems = getEventsForDay(selected, items); // gets the daily events and create a list
    });
  }
  //Changing the calendar format
  _formatChangedCallback(CalendarFormat format) {
    setState(() {
      _format = format;
    });
  }
  //Changing the format preventing to reset to the initial page everytime you rebuild the interface
  _onPageChangedCallback(DateTime newMonth) {
    _focusedDay = newMonth;
  }

  _newItemCallBack(Item? newItem) {
    _onDaySelectedCallback(_selectedDay, _focusedDay);
    if(newItem != null) {
      setState(() {
        items.add(newItem);
        _filteredItems = getEventsForDay(_selectedDay, items);
      });
    } else {
      return;
    }
  }



  @override
  void didChangeDependencies() async {
    items = await fetchingItems();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    info = CalendarInfo(_focusedDay, _selectedDay, _format,
        _onDaySelectedCallback, _formatChangedCallback, _onPageChangedCallback);



    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            insertFloating(_selectedDay, ObjectType.food, context, _newItemCallBack),
            insertFloating(_selectedDay, ObjectType.mood, context, _newItemCallBack),
            insertFloating(_selectedDay, ObjectType.stool, context, _newItemCallBack),
          ],
        ),
      ),
      body: Column(
        children: [
          myCalendar(
              info,
              items,
             ),
          const SizedBox(height: 8.0),
          buildList(_filteredItems, context)
        ],
      ),
    );
  }
}