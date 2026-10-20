import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screens_top.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/calendar_converters_json.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/date_event_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
  late final CalendarModel _events =
      widget.category.calendarEvents ?? const CalendarModel();

  /// The month/week on screen; kept across rebuilds so changing the format
  /// doesn't jump back to the first month.
  late DateTime _focusedDay = _events.startDate ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (_events.startDate == null || _events.endDate == null) {
      return EmptyCategoryView(category: widget.category);
    }
    return Scaffold(
      appBar: appAppBar(
        title: widget.category.displayTitle,
      ),
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
                if (_selectedDay != null) ...displaySelectedDateEvents(context),
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
      ..._getEventsForDay(_selectedDay!).map(
        // In the title (not `leading`, which can't wrap: a long description
        // crashed the tile) with the color the leading slot had.
        (event) => ListTile(
          title: Text(
            "${event.time.format(context)} - ${event.description}",
            style: AppTextStyle().description.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    ];
  }

  List<DateEventModel> _getEventsForDay(DateTime day) =>
      _events.dateEventMap[calendarDayKey(day)] ?? const [];

  TableCalendar<DateEventModel> tableCalendar(BuildContext context) {
    return TableCalendar<DateEventModel>(
      locale: getLanguageCode(),
      focusedDay: _focusedDay,
      firstDay: _events.startDate!,
      lastDay: _events.endDate!,
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarFormat: _calendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = calendarDayKey(selectedDay);
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) => _focusedDay = focusedDay,
      daysOfWeekHeight: 30,
      eventLoader: _getEventsForDay,
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

  // _selectedDay is a UTC-midnight calendar key; read its y/m/d directly
  // (calling toLocal() would shift the day in negative UTC offsets).
  String getDateString() => "${_selectedDay!.day}/${_selectedDay!.month}";
}
