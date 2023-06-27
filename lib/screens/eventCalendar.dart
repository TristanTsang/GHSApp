import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:school_app/screens/event.dart';
import 'package:intl/intl.dart';

import '../widgets.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  late final ValueNotifier<List<Event>> _selectedEvents;
  LinkedHashMap<DateTime, List<Event>> eventsMap =
      LinkedHashMap<DateTime, List<Event>>();

  List<Event> _getEventsForDay(DateTime day) {
    return eventsMap[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Loads Event Data into Calendar DateTime Event Map
    List<Event> eventList = Provider.of<AppData>(context).eventArray;
    Provider.of<AppData>(context).updateEventMap(eventList);
    eventsMap = Provider.of<AppData>(context).eventsMap;
    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.all(10),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.red[900],
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => AddEventScreen()));
            },
          ),
        ),
        bottomNavigationBar: myAppBar(),
        appBar: AppBar(
          title: const Text(
            "Event Calendar",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: Column(
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(
                markerMargin:
                    const EdgeInsets.symmetric(horizontal: 1.5, vertical: 5),
                todayTextStyle: const TextStyle(
                    color: const Color(0xFFFAFAFA), fontSize: 17.5),
                defaultTextStyle: TextStyle(fontSize: 17.5),
                weekendTextStyle: TextStyle(fontSize: 17.5),
                outsideTextStyle: const TextStyle(
                    color: const Color(0xFFAEAEAE), fontSize: 17.5),
                cellMargin: EdgeInsets.all(7.5),
                markerSizeScale: 0.15,
                markersMaxCount: 3,
                markerDecoration: BoxDecoration(
                    color: Colors.red[900], shape: BoxShape.circle),
                selectedTextStyle: TextStyle(
                    color: Colors.red[600],
                    fontWeight: FontWeight.w900,
                    fontSize: 17.5),
                selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red[600]!, width: 3)),
                todayDecoration: BoxDecoration(
                    color: Colors.red[300], shape: BoxShape.circle),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
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
                });
                _selectedEvents.value = _getEventsForDay(selectedDay);
              },
              eventLoader: (day) {
                return _getEventsForDay(day);
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const Divider(thickness: 2),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  if (_selectedEvents.value.length == 0) {
                    return Column(
                      children: [
                        Image(
                            image: AssetImage("images/glenelghs.png"),
                            width: MediaQuery.of(context).size.width * 0.33),
                        Text("No Events Today!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("It looks like it's time to enjoy some time off."),
                      ],
                    );
                  }
                  return ListView.separated(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventScreen(
                                          event: value[index],
                                        )));
                          },
                          horizontalTitleGap: 10,
                          minLeadingWidth: 25,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          leading: Icon(Icons.calendar_month,
                              color: Colors.red[900]),
                          title: Text("${value[index].title}",
                              style: TextStyle(
                                  color: Colors.red[900],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          subtitle: Text(
                              "Date: ${DateFormat.yMMMMd('en_US').format(value[index].eventDate)} from ${DateFormat.jm().format(value[index].startTime)} to ${DateFormat.jm().format(value[index].endTime)}",
                              style: TextStyle(
                                  fontSize: 12.5, color: Colors.grey)),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 2,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }


}

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  String? text;
  String? title;
  DateTime _date = DateTime.now();
  DateTime startTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,DateTime.now().hour,30);
  DateTime endTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,(DateTime.now().hour+1),30 );

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute));
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height*0.2,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Add Event",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Title"),
                        autofocus: true,
                        textAlign: TextAlign.center,
                        onChanged: (newText) {
                          title = newText;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                      child: TextField(
                        maxLines: null,
                        autofocus: true,
                        decoration:
                        InputDecoration(hintText: "Event Details"),
                        textAlign: TextAlign.center,
                        onChanged: (newText) {
                          text = newText;
                        },
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text("Date",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text("Start Time",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text("End Time",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red[900]),
                            child: RawMaterialButton(
                              onPressed: () async {
                                final date = await pickDate();
                                if (date == null) return;
                                _date = date;
                              },
                              child: Center(
                                child: Text(
                                    "${DateFormat.yMd('en_US').format(_date)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:5),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red[900]),
                            child: RawMaterialButton(
                              onPressed: () async {
                                final time = await pickTime();
                                if (time == null) return;
                                startTime = DateTime(_date.year, _date.month,
                                    _date.day, time.hour, time.minute);
                              },
                              child: Center(
                                child: Text("${DateFormat.jm().format(startTime!)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:5),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red[900]),
                            child: RawMaterialButton(
                              onPressed: () async {
                                final time = await pickTime();
                                if (time == null) return;
                                endTime = DateTime(_date.year, _date.month,
                                    _date.day, time.hour, time.minute);
                              },
                              child: Center(
                                child: Text("${DateFormat.jm().format(endTime!)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RawMaterialButton(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                color: Colors.red[200],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RawMaterialButton(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                color: Colors.red[900],
                              ),
                              onPressed: () {
                                Provider.of<AppData>(context, listen: false)
                                    .addEvent(Event(
                                  title: title!,
                                  description: text!,
                                  eventDate: _date,
                                  startTime: startTime,
                                  endTime: endTime,
                                ));
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
