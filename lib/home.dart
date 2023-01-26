import 'package:calendario/calendar.dart';
import 'package:flutter/material.dart';
import 'ui/functions.dart';
import 'package:table_calendar/table_calendar.dart';
import 'ui/objects.dart';
import 'utils/settings.dart';


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

  //TODO: Function to add a Food
  // _insertZucchini(DateTime selected) {
  //   Food zucchini = Food("zucchini", selected);
  //   zucchini.foodValue = "zucchini";
  //   zucchini.dateTime = selected;
  //   setState(() {
  //     db.insertFood(zucchini).then((newId) {
  //       zucchini.id = newId;
  //       print("zucchini was inserted in the database with the id: $newId");
  //     }
  //
  //     );
  //   });
  // }

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
      backgroundColor: Colors.pinkAccent[300],
      floatingActionButton: floatingButton(_selectedDay),
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