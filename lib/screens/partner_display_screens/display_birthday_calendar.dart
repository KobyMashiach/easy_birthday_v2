import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/calendar_model/date_event_model/date_event_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/calendar_model/calendar_model.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/design/general/display_screens_top.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class DisplayBirthdayCalendar extends StatefulWidget {
  const DisplayBirthdayCalendar({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<DisplayBirthdayCalendar> createState() =>
      _DisplayBirthdayCalendarState();
}

class _DisplayBirthdayCalendarState extends State<DisplayBirthdayCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? _selectedDay;
  late CalendarModel _events;

  @override
  void initState() {
    super.initState();
    _events = widget.category.calendarEvents ?? const CalendarModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: widget.category.titleAppear!),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DisplayScreensTop(category: widget.category),
                tableCalendar(context),
                const SizedBox(height: 8.0),
                if (_selectedDay != null) ...displaySelectedDateEvents(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> displaySelectedDateEvents(BuildContext context) {
    return [
      Text(
        t.event_in_date(date: getDateString()),
        style: AppTextStyle().title,
      ),
      ..._getEventsForDay(_selectedDay!).map((event) => ListTile(
            leading: Text(
              "${event.time.format(context)} - ${event.description}",
              style: AppTextStyle().description,
            ),
          )),
    ];
  }

  List<DateEventModel> _getEventsForDay(DateTime day) {
    DateTime normalizedDay = DateTime(day.year, day.month, day.day);
    for (DateTime eventDate in _events.dateEventMap.keys) {
      DateTime normalizedEventDate =
          DateTime(eventDate.year, eventDate.month, eventDate.day);
      if (normalizedEventDate == normalizedDay) {
        return _events.dateEventMap[eventDate] ?? [];
      }
    }
    return [];
  }

  TableCalendar<dynamic> tableCalendar(BuildContext context) {
    return TableCalendar(
      locale: getLanguageCode(),
      focusedDay: _selectedDay ?? _events.startDate!,
      firstDay: _events.startDate!,
      lastDay: _events.endDate!,
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarFormat: _calendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
      },
      daysOfWeekHeight: 30,
      eventLoader: (day) {
        DateTime eventDate = DateTime(day.year, day.month, day.day);
        return _events.dateEventMap.entries
            .where((entry) =>
                entry.key.year == eventDate.year &&
                entry.key.month == eventDate.month &&
                entry.key.day == eventDate.day)
            .map((entry) => entry.value)
            .expand((eventList) =>
                eventList) // Flatten the list if there are multiple events
            .toList();
      },
      availableCalendarFormats: {
        CalendarFormat.week: t.month,
        CalendarFormat.twoWeeks: t.week,
        CalendarFormat.month: t.two_weeks,
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
    );
  }

  String getDateString() =>
      "${_selectedDay!.toLocal().day}/${_selectedDay!.toLocal().month}";
}
