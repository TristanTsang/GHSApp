import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';

//Contains essential information needed to manage and display announcements
class Announcement {
  late String title;
  late String text;
  late DateTime date;
  bool read = false;

  Announcement({required this.title, required this.text, required this.date}){}

  markRead(){
    read = true;
  }
}

class AnnouncementCard extends StatelessWidget {
  late Announcement announcement;
  AnnouncementCard({required this.announcement}){}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AnnouncementScreen(announcement: announcement,)));},
      child: ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        horizontalTitleGap: 10,
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.symmetric(vertical:0),
        leading: Icon(Icons.campaign),
        title: Text("${announcement.title}", style: TextStyle(fontSize: 15, fontWeight:FontWeight.w500)),
        subtitle: Text("Posted on ${announcement.date.month}/${announcement.date.day}/${announcement.date.year}", style: TextStyle(fontSize:12.5, color: Colors.grey)),
      ),
    );
  }
}

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcements Inbox Page", style: TextStyle(fontSize: 25, color: Colors.white),),
      backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: Provider.of<AppData>(context).announcementWidgets(Provider.of<AppData>(context).announcementArray),
        ),
      )
    );
  }
}

class AnnouncementScreen extends StatelessWidget {
  late Announcement announcement;
  AnnouncementScreen({required this.announcement}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${announcement.title}",
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
              title: Text("${announcement.title}"),
              subtitle: Text("Posted on ${announcement.date.month}/${announcement.date.day}/${announcement.date.year}", style: TextStyle(fontSize:12.5, color: Colors.grey)),
            ),
            Divider(thickness: 1, height: 1),
            SizedBox(height: 30),
            Text(textAlign: TextAlign.left, "${announcement.text}"),
          ],
        ),
      ),
    );
  }
}

