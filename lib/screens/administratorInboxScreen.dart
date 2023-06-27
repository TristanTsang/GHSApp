import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../appData.dart';
import 'absenceScreens.dart';
import 'bugScreens.dart';
import 'emailScreen.dart';
class AdministratorInboxScreen extends StatefulWidget {
  const AdministratorInboxScreen({Key? key}) : super(key: key);

  @override
  State<AdministratorInboxScreen> createState() =>
      _AdministratorInboxScreenState();
}

class _AdministratorInboxScreenState extends State<AdministratorInboxScreen> {
  List<Widget> BugReportList(List<BugReport> data) {
    List<Widget> widgets = [];
    for (int i = 0; i < data.length; i++) {
      var current = data[i];
      widgets.add(RawMaterialButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BugScreen(bug: data[i])));
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black, width: 2.5)),
              child: Row(
                children: [
                  Icon(Icons.history, size: 40, color: Colors.red[900]),
                  SizedBox(width: 20),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      current.subject,
                      style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Date: ${DateFormat.yMd().add_jm().format(current.date)}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Email: ${current.email}",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ));
    }
    return widgets;
  }

  List<Widget> AbsenceReportList(List<AbsenceReport> data) {
    List<Widget> widgets = [];
    for (int i = 0; i < data.length; i++) {
      var current = data[i];
      widgets.add(RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AbsenceScreen(absence: data[i])));
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black, width: 2.5)),
              child: Row(
                children: [
                  Icon(Icons.history, size: 40, color: Colors.red[900]),
                  SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${current.name}:  ${current.reason}",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Date: ${DateFormat.yMd().add_jm().format(current.date)}",
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          "Email: ${current.email}",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ));
    }
    return widgets;
  }
  String type = "Absence Report";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red[900],
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.chevron_left, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Adminstrator Contact",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                )),
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.67,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[50]
              ),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: type == "Absence Report" ? Colors.red[900] : Colors.blueGrey[100],
                        ),
                        child: RawMaterialButton(
                          onPressed: () {setState(() {
                            type = ("Absence Report");
                          });},
                          child: Text(
                            "Absence Report",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: type == "Bug Report" ? Colors.red[900] : Colors.blueGrey[100],
                        ),
                        child: RawMaterialButton(
                          onPressed: () {setState(() {
                            type = ( "Bug Report");
                          });},
                          child: Text(
                            "Bug Report",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView(
                    children: (type== "Absence Report") ? AbsenceReportList(
                        Provider.of<AppData>(context).absenceReportData) : BugReportList(
                        Provider.of<AppData>(context).bugReportData)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

