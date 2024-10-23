import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
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
  DateTimeRange? rangeDateTime;
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
                pickRangeDateButton(context),
                if (rangeDateTime != null) tableCalendar(context),
                const SizedBox(height: 8.0),
                if (_selectedDay != null) ...displaySelectedDateEvents(context)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {},
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
              event,
              style: AppTextStyle().description,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                final userChoise = await showDialog(
                  context: context,
                  builder: (context) => generalDialog(
                      title: t.sure_delete(context: globalGender)),
                );
                if (userChoise) {
                  setState(() {
                    _events[_selectedDay]!.remove(event);
                    if (_events[_selectedDay]!.isEmpty) {
                      _events.remove(_selectedDay);
                    }
                  });
                }
              },
            ),
          )),
      appButton(
          text: t.add_event(context: globalGender),
          unfillColors: true,
          onTap: () => _addEvent(context, _selectedDay!)),
    ];
  }

  TableCalendar<dynamic> tableCalendar(BuildContext context) {
    return TableCalendar(
      locale: getLanguageCode(),
      focusedDay: _selectedDay ?? rangeDateTime!.start,
      firstDay: rangeDateTime!.start,
      lastDay: rangeDateTime!.end,
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
      onDayLongPressed: (selectedDay, focusedDay) {
        _addEvent(context, selectedDay);
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
    );
  }

  Widget pickRangeDateButton(BuildContext context) {
    return appButton(
      text: t.pick_date_range,
      margin: const EdgeInsets.all(12),
      onTap: () async {
        final DateTimeRange? pickedRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );

        if (pickedRange != null) {
          setState(() {
            _selectedDay = null;
            rangeDateTime = pickedRange;
          });
        }
      },
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

  Future<void> _addEvent(BuildContext context, DateTime selectedDay) async {
    final TextEditingController eventController = TextEditingController();
    TimeOfDay? selectedTime;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(t.add_event_date(
                    context: globalGender, date: getDateString())),
                AppTextField(
                  hintText: t.event_description,
                  controller: eventController,
                  textInputAction: TextInputAction.newline,
                  keyboard: TextInputType.multiline,
                  maxLines: 2,
                  maxLength: 30,
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
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              setState(() {
                                selectedTime = time;
                              });
                            }
                          },
                          text: selectedTime == null
                              ? t.select_time
                              : t.selected_time(
                                  time: selectedTime!.format(context))),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: appButton(
                        disableColors: !(eventController.text.isNotEmpty &&
                            selectedTime != null),
                        onTap: () {
                          if (eventController.text.isNotEmpty &&
                              selectedTime != null) {
                            setState(() {
                              final eventText =
                                  '${selectedTime!.format(context)} - ${eventController.text}';
                              if (_events[selectedDay] != null) {
                                _events[selectedDay]!.add(eventText);
                              } else {
                                _events[selectedDay] = [eventText];
                              }
                            });
                            Navigator.pop(context);
                          }
                        },
                        text: t.add_event(context: globalGender),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  String getDateString() =>
      "${_selectedDay!.toLocal().day}/${_selectedDay!.toLocal().month}";
}
