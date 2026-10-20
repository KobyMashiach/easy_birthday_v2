import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/calendar_converters_json.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/date_event_model.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddBirthdayCalendarScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;

  final void Function(CategoryModel category, CalendarModel calendar) onDone;
  const AddBirthdayCalendarScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

  @override
  State<AddBirthdayCalendarScreen> createState() =>
      _AddBirthdayCalendarScreenState();
}

class _AddBirthdayCalendarScreenState extends State<AddBirthdayCalendarScreen> {
  bool lock = false;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? _selectedDay;
  late CalendarModel _events;

  @override
  void initState() {
    lock = widget.category.lock;
    _events = widget.category.calendarEvents ?? const CalendarModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.birthday_calendar),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...topWidgets,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pickRangeDateButton(context),
                    buttonContainer(
                      icon: lock ? Icons.lock_outline : Icons.lock_open,
                      title: lock ? t.lock : t.unlock,
                      onTap: () => setState(() => lock = !lock),
                    ),
                  ],
                ),
                if (_events.startDate != null) tableCalendar(context),
                const SizedBox(height: 8.0),
                if (_selectedDay != null) ...displaySelectedDateEvents(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonDisable: _events.startDate == null,
        activeButtonOnTap: _events.startDate != null
            ? () {
                widget.onDone.call(
                  widget.category.copyWith(lock: lock),
                  _events,
                );
                context.popIfPossible();
              }
            : null,
      ),
    );
  }

  List<Widget> displaySelectedDateEvents(BuildContext context) {
    final DateTime selectedDay = _selectedDay!;
    return [
      Text(
        t.event_in_date(date: getDateString(selectedDay)),
        style: AppTextStyle().title,
      ),
      ..._getEventsForDay(selectedDay).map(
        (event) => ListTile(
          // As title (not leading) so a long description wraps.
          title: Text(
            "${event.time.format(context)} - ${event.description}",
            style: AppTextStyle().description,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              final userChoice = await showDialog<bool>(
                context: context,
                builder: (context) => generalDialog(
                  title: t.sure_delete(context: SessionService().gender),
                ),
              );
              if (userChoice == true && mounted) {
                removeEvent(selectedDay, event);
              }
            },
          ),
        ),
      ),
      appButton(
        text: t.add_event(context: SessionService().gender),
        unfillColors: true,
        onTap: () => _addEvent(context, selectedDay),
      ),
    ];
  }

  TableCalendar<DateEventModel> tableCalendar(BuildContext context) {
    return TableCalendar<DateEventModel>(
      locale: getLanguageCode(),
      focusedDay: _selectedDay ?? _events.startDate!,
      firstDay: _events.startDate!,
      lastDay: _events.endDate ?? _events.startDate!,
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarFormat: _calendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = calendarDayKey(selectedDay);
        });
      },
      onDayLongPressed: (selectedDay, focusedDay) {
        _addEvent(context, calendarDayKey(selectedDay));
      },
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

  Widget pickRangeDateButton(BuildContext context) {
    return buttonContainer(
      title: t.pick_date_range,
      icon: Icons.date_range_outlined,
      onTap: () async {
        final DateTimeRange? pickedRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );

        if (pickedRange != null && mounted) {
          setState(() {
            _selectedDay = null;
            _events = _events.copyWith(
              startDate: pickedRange.start,
              endDate: pickedRange.end,
              dateEventMap: {},
            );
          });
        }
      },
    );
  }

  List<DateEventModel> _getEventsForDay(DateTime day) =>
      _events.dateEventMap[calendarDayKey(day)] ?? const [];

  List<Widget> get topWidgets {
    return [
      Text(t.birthday_calendar, style: AppTextStyle().bigTitle),
      SvgPicture.asset(widget.category.categoryType.getImage(), height: 200),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              t.write_calendar_time_to(
                title: widget.category.displayTitle,
              ),
              style: AppTextStyle().title,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AddTitleDialog(
                  title: widget.category.displayTitle,
                  onInputText: (text) {
                    widget.onChangeTitle.call(
                      widget.category.copyWith(titleAppear: text),
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    ];
  }

  Future<void> _addEvent(BuildContext context, DateTime selectedDay) async {
    final DateTime day = calendarDayKey(selectedDay);
    final DateEventModel? newEvent = await showModalBottomSheet<DateEventModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) =>
          _AddEventSheet(dateString: getDateString(day)),
    );
    if (newEvent != null && mounted) {
      addNewEvent(newEvent, day);
    }
  }

  void addNewEvent(DateEventModel newEvent, DateTime selectedDay) {
    final DateTime day = calendarDayKey(selectedDay);
    setState(() {
      final updatedDateEventMap = Map<DateTime, List<DateEventModel>>.from(
        _events.dateEventMap,
      );

      final dayEvents = [...?updatedDateEventMap[day], newEvent]
        ..sort((a, b) {
          final timeA = a.time;
          final timeB = b.time;
          return timeA.hour.compareTo(timeB.hour) != 0
              ? timeA.hour.compareTo(timeB.hour)
              : timeA.minute.compareTo(timeB.minute);
        });
      updatedDateEventMap[day] = dayEvents;

      _events = _events.copyWith(dateEventMap: updatedDateEventMap);
    });
  }

  void removeEvent(DateTime selectedDay, DateEventModel event) {
    final DateTime day = calendarDayKey(selectedDay);
    setState(() {
      final updatedDateEventMap = Map<DateTime, List<DateEventModel>>.from(
        _events.dateEventMap,
      );

      final existing = updatedDateEventMap[day];
      if (existing != null) {
        final dayEvents = [...existing]..remove(event);
        if (dayEvents.isEmpty) {
          updatedDateEventMap.remove(day);
        } else {
          updatedDateEventMap[day] = dayEvents;
        }

        _events = _events.copyWith(dateEventMap: updatedDateEventMap);
      }
    });
  }

  // Days are UTC-midnight calendar keys; read y/m/d directly (toLocal()
  // would shift the day in negative UTC offsets).
  String getDateString(DateTime day) => "${day.day}/${day.month}";
}

/// Bottom sheet for creating an event. Owns its own state (so picking a time
/// updates the sheet) and its controller (disposed with the sheet).
/// Pops with the new [DateEventModel], or null when dismissed.
class _AddEventSheet extends StatefulWidget {
  final String dateString;
  const _AddEventSheet({required this.dateString});

  @override
  State<_AddEventSheet> createState() => _AddEventSheetState();
}

class _AddEventSheetState extends State<_AddEventSheet> {
  final TextEditingController eventController = TextEditingController();
  TimeOfDay? selectedTime;

  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }

  bool get canAdd => eventController.text.isNotEmpty && selectedTime != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.add_event_date(
                context: SessionService().gender,
                date: widget.dateString,
              ),
            ),
            AppTextField(
              hintText: t.event_description,
              controller: eventController,
              textInputAction: TextInputAction.newline,
              keyboard: TextInputType.multiline,
              maxLines: 2,
              maxLength: 30,
              onChanged: (_) => setState(() {}),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: appButton(
                    unfillColors: true,
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: selectedTime ?? TimeOfDay.now(),
                      );
                      if (time != null && mounted) {
                        setState(() => selectedTime = time);
                      }
                    },
                    text: selectedTime == null
                        ? t.select_time
                        : t.selected_time(time: selectedTime!.format(context)),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: appButton(
                    disableColors: !canAdd,
                    onTap: () {
                      if (!canAdd) return;
                      Navigator.pop(
                        context,
                        DateEventModel(
                          time: selectedTime!,
                          description: eventController.text,
                        ),
                      );
                    },
                    text: t.add_event(context: SessionService().gender),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
