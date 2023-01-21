import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';
class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Announcements Inbox", style: TextStyle(fontSize: 25, color: Colors.white),),
          backgroundColor: Colors.red[900],
        ),
      body: SingleChildScrollView(
        child:Column(
          children: Provider.of<AppData>(context).announcementWidgets(Provider.of<AppData>(context).announcementArray),
        )
      )
    );
  }
}
