import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class AddBirthdayCalendarScreen extends StatefulWidget {
  final CategoryModel category;
  const AddBirthdayCalendarScreen({super.key, required this.category, s});

  @override
  State<AddBirthdayCalendarScreen> createState() =>
      _AddBirthdayCalendarScreenState();
}

class _AddBirthdayCalendarScreenState extends State<AddBirthdayCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late TextEditingController textController;

  DateTime? _selectedDay;
  final Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    textController = TextEditingController();
    textController.text = widget.category.wishesList?.contract ?? "";
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Function to open a dialog for adding events
  Future<void> _addEvent(BuildContext context, DateTime selectedDay) async {
    final TextEditingController eventController = TextEditingController();
    TimeOfDay? selectedTime;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add Event for ${selectedDay.toLocal()}'.split(' ')[0]),
              TextField(
                controller: eventController,
                decoration: const InputDecoration(
                  labelText: 'Event description',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() {
                      selectedTime = time;
                    });
                  }
                },
                child: Text(selectedTime == null
                    ? 'Select Time'
                    : 'Selected Time: ${selectedTime!.format(context)}'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (eventController.text.isNotEmpty && selectedTime != null) {
                    setState(() {
                      final eventText =
                          '${eventController.text} at ${selectedTime!.format(context)}';
                      if (_events[selectedDay] != null) {
                        _events[selectedDay]!.add(eventText);
                      } else {
                        _events[selectedDay] = [eventText];
                      }
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Event'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.write_contract),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...topWidgets,
                TableCalendar(
                  locale: getLanguageCode(),
                  firstDay: DateTime.utc(2024, 11, 17),
                  lastDay: DateTime.utc(2024, 11, 20),
                  focusedDay: DateTime.utc(2024, 11, 17),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  calendarFormat: _calendarFormat,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                    _addEvent(context, selectedDay); // Open dialog to add event
                  },
                  daysOfWeekHeight: 30,
                  eventLoader: (day) {
                    return _events[day] ?? [];
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
                ),
                const SizedBox(height: 8.0),
                if (_selectedDay != null) ...[
                  Text(
                    'Events for ${_selectedDay!.toLocal()}'.split(' ')[0],
                    style: AppTextStyle().title,
                  ),
                  ..._getEventsForDay(_selectedDay!).map((event) => ListTile(
                        title: Text(event),
                      )),
                ]
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          // Handle your button logic
        },
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  List<Widget> get topWidgets {
    return [
      Text(t.birthday_calendar, style: AppTextStyle().bigTitle),
      SvgPicture.asset(widget.category.categoryType.getImage(), height: 200),
      Text(
        t.write_calendar_time_to(title: widget.category.titleAppear!),
        style: AppTextStyle().title,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
