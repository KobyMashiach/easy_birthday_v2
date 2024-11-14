import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/calendar_model/calendar_model.dart';
import 'package:easy_birthday/models/calendar_model/date_event_model/date_event_model.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/design/general/button_container.dart';
import 'package:easy_birthday/widgets/dialogs/edit_title.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class AddBirthdayCalendarScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(CategoryModel category) onChangeTitle;

  final Function(CategoryModel category, CalendarModel calendar) onDone;
  const AddBirthdayCalendarScreen(
      {super.key,
      required this.category,
      required this.onChangeTitle,
      required this.onDone});

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
                        onTap: () => setState(() => lock = !lock)),
                  ],
                ),
                if (_events.startDate != null) tableCalendar(context),
                const SizedBox(height: 8.0),
                if (_selectedDay != null) ...displaySelectedDateEvents(context)
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
                widget.onDone
                    .call(widget.category.copyWith(lock: lock), _events);
                Navigator.of(context).pop();
              }
            : null,
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
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                final userChoise = await showDialog(
                  context: context,
                  builder: (context) => generalDialog(
                      title: t.sure_delete(context: globalGender)),
                );
                if (userChoise) {
                  setState(() => removeEvent(_selectedDay!, event));
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
      onDayLongPressed: (selectedDay, focusedDay) {
        _addEvent(context, selectedDay);
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

        if (pickedRange != null) {
          setState(() {
            _selectedDay = null;
            _events = _events.copyWith(
                startDate: pickedRange.start,
                endDate: pickedRange.end,
                dateEventMap: {});
          });
        }
      },
    );
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

  List<Widget> get topWidgets {
    return [
      Text(t.birthday_calendar, style: AppTextStyle().bigTitle),
      SvgPicture.asset(widget.category.categoryType.getImage(), height: 200),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            t.write_calendar_time_to(title: widget.category.titleAppear!),
            style: AppTextStyle().title,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) => AddTitleDialog(
                          title: widget.category.titleAppear!,
                          onInputText: (text) {
                            widget.onChangeTitle.call(
                                widget.category.copyWith(titleAppear: text));
                          },
                        ));
              },
              icon: const Icon(Icons.edit))
        ],
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
                        onTap: () => addNewEvent(eventController, selectedTime,
                            selectedDay, context),
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

  void addNewEvent(TextEditingController eventController,
      TimeOfDay? selectedTime, DateTime selectedDay, BuildContext context) {
    if (eventController.text.isNotEmpty && selectedTime != null) {
      setState(() {
        final newEvent = DateEventModel(
          time: selectedTime,
          description: eventController.text,
        );

        final updatedDateEventMap =
            Map<DateTime, List<DateEventModel>>.from(_events.dateEventMap);

        if (updatedDateEventMap[selectedDay] != null) {
          updatedDateEventMap[selectedDay]!.add(newEvent);
        } else {
          updatedDateEventMap[selectedDay] = [newEvent];
        }
        updatedDateEventMap[selectedDay]!.sort((a, b) {
          final timeA = a.time;
          final timeB = b.time;
          return timeA.hour.compareTo(timeB.hour) != 0
              ? timeA.hour.compareTo(timeB.hour)
              : timeA.minute.compareTo(timeB.minute);
        });

        _events = _events.copyWith(dateEventMap: updatedDateEventMap);
      });

      Navigator.pop(context);
    }
  }

  void removeEvent(DateTime selectedDay, DateEventModel event) {
    setState(() {
      final updatedDateEventMap =
          Map<DateTime, List<DateEventModel>>.from(_events.dateEventMap);

      if (updatedDateEventMap[selectedDay] != null) {
        updatedDateEventMap[selectedDay]!.remove(event);
        if (updatedDateEventMap[selectedDay]!.isEmpty) {
          updatedDateEventMap.remove(selectedDay);
        }

        _events = _events.copyWith(dateEventMap: updatedDateEventMap);
      }
    });
  }

  String getDateString() =>
      "${_selectedDay!.toLocal().day}/${_selectedDay!.toLocal().month}";
}
