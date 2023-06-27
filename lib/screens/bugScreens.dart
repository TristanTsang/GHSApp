import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appData.dart';
import 'emailScreen.dart';
import 'imageScreen.dart';

class BugScreen extends StatelessWidget {
  late BugReport bug;

  BugScreen({required this.bug}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bug Report",
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
              leading: Icon(Icons.error, size: 45),
              title: Text("${bug.subject}"),
              subtitle: Text(
                  "Posted on ${bug.date.month}/${bug.date.day}/${bug.date.year} by ${bug.email}",
                  style: TextStyle(fontSize: 12.5, color: Colors.grey)),
            ),
            Divider(thickness: 1, height: 1),
            SizedBox(height: 30),
            Text(textAlign: TextAlign.left, "${bug.description}"),
            SizedBox(height: 250),
            Center(
              child: Column(
                children: [
                  Text("Sorry to hear about your experience!"),
                  Image(
                      image: AssetImage("images/glenelghs.png"),
                      width: MediaQuery.of(context).size.width * 0.33),
                  Text("The bug will be fixed promptly!"),
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
                        Provider.of<AppData>(context, listen:false)
                            .bugReportData
                            .remove(bug);
                        Navigator.popAndPushNamed(context, 'MainScreen');
                      },
                      text: "Resolve Bug"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}