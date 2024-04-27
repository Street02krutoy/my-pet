import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_pet/global.dart';
import 'package:my_pet/utils/keycloak.dart';
import 'package:table_calendar/table_calendar.dart';

import '../classes/event_class.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;

  late Map<DateTime, List<Event>> _events;

  List _getEventsForTheDay(DateTime day) {
    return _events[day] ?? [];
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  _loadGlobalEvents() async {
    for (var event in gEvents) {
      final day =
          DateTime.utc(event.date.year, event.date.month, event.date.day);

      if (_events[day] == null) {
        _events[day] = [];
      }
      _events[day]!.add(event);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 7));
    _lastDay = DateTime.now().add(const Duration(days: 365));

    _events = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    _loadGlobalEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Календарь"),
          actions: [Keycloak.loginButton],
        ),
        body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 16, 0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        TableCalendar(
                            calendarFormat: CalendarFormat.month,
                            availableCalendarFormats: const {
                              CalendarFormat.month: 'month'
                            },
                            eventLoader: _getEventsForTheDay,
                            focusedDay: _focusedDay,
                            firstDay: _firstDay,
                            lastDay: _lastDay,
                            selectedDayPredicate: (day) =>
                                isSameDay(day, gSelectedDate),
                            onPageChanged: (focusedDay) {
                              setState(() {
                                _focusedDay = focusedDay;
                              });
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                gSelectedDate = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }),
                        ..._getEventsForTheDay(gSelectedDate).map(
                          (event) => ListTile(
                              title: Text(
                                event.note,
                              ),
                              subtitle: Text(DateFormat('dd/MM/yyyy HH:mm a')
                                  .format(event.date)),
                              trailing: IconButton(
                                  // iconSize: 32,
                                  onPressed: () {
                                    gEvents.remove(event);
                                    event.refPet.events.remove(event);
                                    _events = <DateTime, List<Event>>{};
                                    _loadGlobalEvents();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.delete))),
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
