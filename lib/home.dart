import 'package:calendario/calendar.dart';
import 'package:flutter/material.dart';
import 'ui/functions.dart';
import 'package:table_calendar/table_calendar.dart';
import 'ui/objects.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  List _filteredEvents = [];

  //TEMPORARY: When I wanna change a food
  _selectedAddCallback(List events, int index) {
    setState(() {
      events[index].foodValue = "Ciccio";
    });
  }

  //Quando viene cliccato un giorno, esso viene selezionato
  _selectedDayCallback(DateTime selected, DateTime focused) {
    setState(() {
      _selectedDay = selected; //seleziona il giorno
      _focusedDay = focused;
      _filteredEvents = getEventsForDay(selected, foods); // assegna gli eventi giornalieri alla lista
    });
  }
  //Quando viene cliccato il formato del calendario, esso cambia
  _formatChangedCallback(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }
  //Quando viene cambiato mese e viene eseguita l'interfaccia, essa non resetta il calendario al mese iniziale
  _onPageChangedCallback(DateTime newMonth) {
    _focusedDay = newMonth;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[300],
      floatingActionButton: calendarButton(),
      body: Column(
        children: [
          myCalendar(_calendarFormat, _selectedDay, _focusedDay, foods, _selectedDayCallback, _formatChangedCallback, _onPageChangedCallback),
          const SizedBox(height: 8.0),
          buildList(_filteredEvents, context, _selectedAddCallback)
        ],
      ),
    );
  }
}