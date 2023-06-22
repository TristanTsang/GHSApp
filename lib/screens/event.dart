import 'package:flutter/material.dart';
//Class containing essential information related to Events later used for event widgets and event displays
class Event {
  late String title;
  late String description;
  late DateTime eventDate;
  late DateTime startTime;
  late DateTime endTime;

  Event(
      {required this.title,
      required this.description,
      required this.eventDate,
      required this.startTime,
      required this.endTime}) {}
}

class EventTile extends StatelessWidget {
  late Event event;
  EventTile({required this.event}) {}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      child: RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventScreen(event: event)));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${event.title}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              Text(
                  "${event.startTime.hour}:${event.startTime.minute} - ${event.endTime.hour}:${event.endTime.minute} on ${event.eventDate.month}/${event.eventDate.day}/${event.eventDate.year}",
                  style: TextStyle(color: Colors.white, fontSize: 10))
            ],
          ),
        ),
      ),
    );
  }
}

class EventTile2 extends StatelessWidget {
  late Event event;
  EventTile2({required this.event}) {}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      child: RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventScreen(event: event)));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: 150,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${event.title}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              Text(
                  "${event.startTime.hour}:${event.startTime.minute} - ${event.endTime.hour}:${event.endTime.minute} on ${event.eventDate.month}/${event.eventDate.day}/${event.eventDate.year}",
                  style: TextStyle(color: Colors.white, fontSize: 10))
            ],
          ),
        ),
      ),
    );
  }
}

class EventScreen extends StatelessWidget {
  late Event event;
  EventScreen({required this.event}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[800],
                ),
                width: MediaQuery.of(context).size.width * 0.45,
                child: RawMaterialButton(
                  child: Text(
                    "FAQ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => FRQScreen(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red[900],
                ),
                width: MediaQuery.of(context).size.width * 0.45,
                child: RawMaterialButton(
                  child: Text(
                    "Discussion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "${event.title}",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.event, size: 45),
              title: Text("${event.title}"),
              subtitle: Text(
                  "${event.startTime.hour}:${event.startTime.minute} - ${event.endTime.hour}:${event.endTime.minute} on ${event.eventDate.month}/${event.eventDate.day}/${event.eventDate.year}"),
            ),
            Divider(thickness: 1, height: 1),
            SizedBox(height: 30),
            Text(textAlign: TextAlign.left, "${event.description}"),
          ],
        ),
      ),
    );
  }
}

class FRQScreen extends StatelessWidget {
  const FRQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.67,
      child: Scaffold(
        appBar: AppBar(
      title: Text(
        "Frequently Asked Questions",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      backgroundColor: Colors.red[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
      children: [
          Text(
              "1. Where should I drop off my student? \tPlease drop off at the front entrance"),
          SizedBox(height:15),
          Text(
              "2. What is the dress attire for this event?\t Please wear formal clothing"),
          SizedBox(height:15),
          Text(
              "3. Will there be food and beverages? \tFood and Beverages will be provided along with options for vegans"),
          SizedBox(height:15),
      ],
          ),
        ),
      ),
    );
  }
}
