import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:school_app/screens/event.dart';
class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<Event>> events ={};
  List<Event>? _selectedEvents;
  var eventsMap = LinkedHashMap(
    equals: isSameDay,
    hashCode: (DateTime date){
      return date.hashCode;
    },
  );

  List<Event> _getEventsForDay(DateTime day) {
    print(events[day]);
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {

    List<Event> eventList = Provider.of<AppData>(context).eventArray;
    for(int i=0; i<eventList.length; i++){
      events[eventList[i].eventDate] = [];
    }
    for(int i=0; i<eventList.length; i++){
      events[eventList[i].eventDate]?.add(eventList[i]);
    }
    events.addAll(events);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Event Calendar",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {

              _calendarFormat = format;
            });
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _selectedEvents = _getEventsForDay(selectedDay);// update `_focusedDay` here as well
            });
          },
            eventLoader: (day) {

              return _getEventsForDay(day);

            }

        ));

  }
}
