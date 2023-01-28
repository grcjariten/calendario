import 'package:calendario/utils/settings.dart';
import 'package:table_calendar/table_calendar.dart';
import 'ui/home_functions.dart';
import 'ui/objects.dart';

TableCalendar myCalendar(
    CalendarInfo calendarInfo,
    List<Item> items,
    ) {
  return TableCalendar(
    // locale: 'pl_PL', //TableCalendar language
    focusedDay: calendarInfo.focusedDay,
    firstDay: defaultFirstDay,
    lastDay: defaultLastDay,


  selectedDayPredicate:
      (day)  => isSameDay(calendarInfo.selectedDay, day)
  ,
  onDaySelected: (selected, focused) {
      calendarInfo.onDaySelectedCallback(selected, focused);
  },
  calendarFormat: calendarInfo.format,
      onFormatChanged: (format) {
        calendarInfo.formatChangedCallback(format);
      },
  onPageChanged: (newMonth) {
    calendarInfo.onPageChangedCallback(newMonth);
  },
  eventLoader: (day)  => getEventsForDay(day, items));
}