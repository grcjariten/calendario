import 'package:table_calendar/table_calendar.dart';
import 'ui/functions.dart';
import 'ui/objects.dart';

TableCalendar myCalendar(
    CalendarInfo calendarInfo,
    List<Item> items,
    ) {
  return TableCalendar(
    // locale: 'pl_PL', //TableCalendar language
    focusedDay: calendarInfo.focusedDay,
    firstDay: DateTime.utc(2021, 01, 16),
    lastDay: DateTime.utc(2040, 01, 16),


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
  eventLoader: (day)  => getEventsForDay(day, items)); //TODO: temporarily gives foods and not more general events (maybe could be a correct approach though for the editing)
}