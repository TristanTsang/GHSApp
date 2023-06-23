import 'package:flutter/material.dart';
import '../widgets.dart';
import 'announcements.dart';
import 'package:provider/provider.dart';
import 'event.dart';
import 'package:school_app/appData.dart';




class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Glenelg Highschool",
        ),
        backgroundColor: Colors.red[900],
      ),
      bottomNavigationBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Center(
            child: Text("Welcome Glenelg Gladiators!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800))),
        Image(
            image: AssetImage("images/glenelghs.png"),
            width: MediaQuery.of(context).size.width * 0.5),
        Material(
          elevation:5,
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Recent Announcements",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.2,
          child: SingleChildScrollView(
            child: Column(
              children: Provider.of<AppData>(context).announcementWidgets(Provider.of<AppData>(context).recentAnnouncements()),
            ),
          ),
        ),
        SizedBox(height:30),
        Material(
          elevation:5,
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Upcoming Events",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:  Provider.of<AppData>(context).eventWidgetsSpaced(Provider.of<AppData>(context).eventArray),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
