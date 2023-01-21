import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';
class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Event Calendar", style: TextStyle(fontSize: 25, color: Colors.white),),
          backgroundColor: Colors.red[900],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
              child:Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 50, // gap between adjacent chips
                    runSpacing: 30,
                  children: Provider.of<AppData>(context).eventWidgets(Provider.of<AppData>(context).eventArray),
                ),
              )
          ),
        )
    );
  }
}
