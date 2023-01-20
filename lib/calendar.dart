import 'package:table_calendar/table_calendar.dart';
import 'ui/functions.dart';
import 'ui/objects.dart';

TableCalendar myCalendar(
    CalendarFormat calendarFormat,

    DateTime? selectedDay,
    DateTime focusedDay,

    List<Food> foods,
    Function onDaySelectedCallback,
    Function formatChangedCallback,
    Function onPageChangedCallback,
    ) {
  return TableCalendar(
    focusedDay: focusedDay,
    firstDay: DateTime.utc(2021, 01, 16),
    lastDay: DateTime.utc(2040, 01, 16),


  selectedDayPredicate:
      (day) {
    return isSameDay(selectedDay, day);
  }
  ,
  onDaySelected: (selected, focused) {
      onDaySelectedCallback(selected, focused);
  },
  calendarFormat: calendarFormat,
      onFormatChanged: (format) {
      formatChangedCallback(format);
      },
  onPageChanged: (newMonth) {
      onPageChangedCallback(newMonth);
  },
  eventLoader: (day) {
      return getEventsForDay(day, foods);
  },
  );
}