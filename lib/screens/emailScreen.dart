import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  late String description;
  late String reason;
  late String name;
  String dropdownvalue = 'Sick';

  // List of items in our dropdown menu
  var items = [
    'Sick',
    'Appointment',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Student Absence", style: TextStyle(fontSize: 25, color: Colors.white),),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              TextField(textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Child\'s Name:'
                ),
                  maxLines: 1,
                  onChanged:(String value){
                    name = value;
                  }),
              SizedBox(height:30),
              Text("Why was your child sick today?*", style: TextStyle(fontSize: 15, )),
              SizedBox(height:10),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blueGrey[50],),
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
              SizedBox(height:45),

              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blueGrey[50],),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("Description*", style: TextStyle(fontSize: 15),),
                    TextField(textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'Write a short explanation here!:',
                        ),

                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged:(String value){
                          description = value;
                        }
                    ),
                  ],
                ),
              ),
              LargeTextButton(
                text:'Send Absence Message!',
                onPressed: () async {
                  final Email send_email = Email(
                    body: 'Student Name: $name\nReason: $dropdownvalue\nDescripton$description',
                    subject: 'Student Absence',
                    recipients: ['tristantsang9786@gmail.com'],
                    isHTML: false,
                  );
                  await FlutterEmailSender.send(send_email);
                  Navigator.popUntil(context, ModalRoute.withName('MainScreen'));
                },
                color: Colors.red[900]!,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LargeTextButton extends StatelessWidget {
  late String text;
  late Function onPressed;
  late Color color;
  late Color textColor;

  LargeTextButton(
      {required this.text,
        required this.onPressed,
        required this.color,
        required this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Container(
        child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      ),
    );
  }
}


