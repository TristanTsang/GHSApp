import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appData.dart';
import 'emailScreen.dart';
import 'imageScreen.dart';

class AbsenceScreen extends StatelessWidget {
  late AbsenceReport absence;

  AbsenceScreen({required this.absence}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${absence.name}:  ${absence.reason}",
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
              leading: Icon(Icons.history, size: 45),
              title: Text("${absence.name}"),
              subtitle: Text(
                  "Posted on ${absence.date.month}/${absence.date.day}/${absence.date.year} by ${absence.email}",
                  style: TextStyle(fontSize: 12.5, color: Colors.grey)),
            ),
            Divider(thickness: 1, height: 1),
            SizedBox(height: 30),
            Text(textAlign: TextAlign.left, "${absence.description}"),
            SizedBox(height: 250),
            Center(
              child: Column(
                children: [
                  Image(
                      image: AssetImage("images/glenelghs.png"),
                      width: MediaQuery.of(context).size.width * 0.33),
                  Text("Make the most out of your day off ${absence.name}!"),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  child: NewWidget(
                      color1: Colors.red[900]!,
                      color2: Colors.white,
                      onPressed: () {
                        Provider.of<AppData>(context, listen: false)
                            .absenceReportData
                            .remove(absence);
                        Navigator.popAndPushNamed(context, 'MainScreen');
                      },
                      text: "Excuse Absence"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}