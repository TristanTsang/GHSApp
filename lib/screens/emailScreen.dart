import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../appData.dart';
import '../widgets.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  String contactType = "Absence Report";
  contactTypeCallBack(String value){
    setState(() {
      contactType = value;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myAppBar(),
      backgroundColor: Colors.red[900],
      body: (contactType== "Absence Report")? AbsenceReportScreen(callback: contactTypeCallBack) : BugReportScreen(callback: contactTypeCallBack),
    );
  }
}

class AbsenceReport{
  String email;
  String name;
  DateTime date= DateTime.now();
  String reason;
  String description;
  AbsenceReport({required this.email, required this.name, required this.reason, required this.description});
}

class BugReport{
  String email;
  DateTime date = DateTime.now();
  String subject;
  String description;
  BugReport({required this.email, required this.subject, required this.description});
}

class AbsenceReportScreen extends StatefulWidget {
  Function(String value) callback;
  AbsenceReportScreen({required this.callback});

  @override
  State<AbsenceReportScreen> createState() => _AbsenceReportScreenState();
}

class _AbsenceReportScreenState extends State<AbsenceReportScreen> {
  String? reason;
  String? name;
  String dropdownvalue = 'Sick';
  String? description;
  // List of items in our dropdown menu
  var items = [
    'Sick',
    'Appointment',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: const Padding(
            padding: EdgeInsets.only(top:30, left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Adminstrator Contact",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          )),
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.67,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[100],
                ),
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red[900],
                          ),
                          child: RawMaterialButton(
                            onPressed: () {
                              widget.callback("Absence Report");
                            },
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
                            color: Colors.blueGrey[50],
                          ),
                          child: RawMaterialButton(
                            onPressed: () {widget.callback("Bug Report");},
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Child\'s Name:'),
                    maxLines: 1,
                    onChanged: (String value) {
                      name = value;
                    }),
              ),
              SizedBox(height: 30),
              Text("Why was your child sick today?*",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[50],
                ),
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 45),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[50],
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Description*",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Write a short explanation here!:',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String value) {
                          description = value;
                        }),
                  ],
                ),
              ),
              LargeTextButton(
                text: 'Send Absence Message!',
                onPressed: (){
                  Provider.of<AppData>(context).addAbsenceReport(AbsenceReport(email: Provider.of<AppData>(context).email!,description: description!, name: name!, reason: reason!));
                  Navigator.pushReplacementNamed(
                      context, 'MainScreen');
                },
                color: Colors.red[900]!,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class BugReportScreen extends StatefulWidget {
  Function(String value) callback;
  BugReportScreen({required this.callback});

  @override
  State<BugReportScreen> createState() => _BugReportScreenState();
}

class _BugReportScreenState extends State<BugReportScreen> {
  String? subject;
  String? description;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: const Padding(
            padding: EdgeInsets.only(top: 30, left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Adminstrator Contact",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          )),
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.67,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[100],
                ),
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:  Colors.blueGrey[50],
                          ),
                          child: RawMaterialButton(
                            onPressed: () {widget.callback("Absence Report");},
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
                            color:Colors.red[900],
                          ),
                          child: RawMaterialButton(
                            onPressed: () {widget.callback("Bug Report");},
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'Subject:'),
                    maxLines: 1,
                    onChanged: (String value) {
                      subject = value;
                    }),
              ),
              SizedBox(height: 85),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[50],
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Description*",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Write a short description of the bug here!:',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String value) {
                          description = value;
                        }),
                  ],
                ),
              ),
              SizedBox(height:120),
              LargeTextButton(
                text: 'Send Bug Report!',
                onPressed: (){
                  Provider.of<AppData>(context).addBugReport(BugReport(email:Provider.of<AppData>(context).email!, subject: subject!, description: description!));
                  Navigator.pushReplacementNamed(
                      context, 'MainScreen');
                },
                color: Colors.red[900]!,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    ]);
  }
}


