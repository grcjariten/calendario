import 'package:table_calendar/table_calendar.dart';

TableCalendar myCalendar(CalendarFormat calendarFormat, DateTime? selectedDay, DateTime? focusedDay, Function selectedDayCallback, Function formatChangedCallback) {
  return TableCalendar(
    focusedDay: DateTime.now(),
    firstDay: DateTime.utc(2021, 01, 16),
    lastDay: DateTime.utc(2040, 01, 16),



//Questo aggiunge interattività al calendario -> quando viene cliccato un giorno cambia il giorno selezionato:
  selectedDayPredicate:
      (day) {
    return isSameDay(selectedDay, day);
  }
  ,
  onDaySelected: (selected, focused) {
      selectedDayCallback(selected, focused);
  },
//Anche questo, appena viene cliccato sul formato, esso cambia:
  calendarFormat: calendarFormat,
      onFormatChanged: (format) {
      formatChangedCallback(format);
      },
  );
}