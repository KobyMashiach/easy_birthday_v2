import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/widgets/animations/staggered_entrance.dart';
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
                if (_selectedDay != null)
                  ...displaySelectedDateEvents(context)
                else
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      t.choose_day_hint(context: SessionService().gender),
                      textAlign: TextAlign.center,
                      style: AppTextStyle().smallDescription,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> displaySelectedDateEvents(BuildContext context) {
    final List<DateEventModel> events = _getEventsForDay(_selectedDay!);
    return [
      Text(
        t.event_in_date(date: getDateString()),
        style: AppTextStyle().title,
      ),
      if (events.isEmpty)
        Text(t.no_events_this_day, style: AppTextStyle().smallDescription),
      for (final (index, event) in events.indexed)
        StaggeredEntrance(
          // Replays for each day picked.
          key: ValueKey((_selectedDay, index)),
          index: index,
          from: const Offset(24, 0),
          child: _EventTile(
            time: event.time.format(context),
            description: event.description,
            isLast: index == events.length - 1,
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
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: AppColors.disableColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        markerDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        markersMaxCount: 3,
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonDecoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
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

/// One plan of the day on a timeline: a dot and line, the time chip and
/// the description.
class _EventTile extends StatelessWidget {
  final String time;
  final String description;
  final bool isLast;

  const _EventTile({
    required this.time,
    required this.description,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                const SizedBox(height: 18),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.disableColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: AppColors.primaryColor),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "🕒 $time",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(description, style: AppTextStyle().description),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
