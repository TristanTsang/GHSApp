import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_share/social_share.dart';
import '../appData.dart';
import '../models.dart';
import '../widgets.dart';
import 'event.dart';
import 'package:intl/intl.dart';

class ImageScreen extends StatelessWidget {
  List<Widget> createEventList(List<EventGallery> events){
    List<Widget> widgetList=[];
    for(int i=0; i<events.length;i++){
      widgetList.add(ImageContainer(event: events[i]));
    }
    return widgetList;
  }
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red[900],
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => AddEventScreen()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: myAppBar(),
      appBar: AppBar(
        title: Text(
          "GHS Event Photos",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Glenelg Community Events",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8b0000))),
            Row(),
            Container(
              height: MediaQuery.of(context).size.height * 0.67,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: createEventList(Provider.of<AppData>(context).eventGalleryList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  late EventGallery event;
  ImageContainer({required this.event}) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 15,
        surfaceTintColor: Colors.grey,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: event.thumbnail, fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${event.title}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${DateFormat.yMMMMd('en_US').format(event.date)}",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        child: Text(
                          "${event.description}",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[900]),
                        ),
                      ),
                      SizedBox(height: 20),
                      RawMaterialButton(
                        onPressed: () {
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhotoGallery(event: event)));
                          };
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageContainer2 extends StatelessWidget {
  late EventGallery event;
  ImageContainer2({required this.event}) {}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:() {
      {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhotoGallery(event: event)));
      }
      ;
    },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 15,
          surfaceTintColor: Colors.grey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: event.thumbnail, fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${event.title}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${DateFormat.yMMMMd('en_US').format(event.date)}",
                          style: TextStyle(fontSize: 12.5, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoGallery extends StatefulWidget {
  EventGallery event;
  PhotoGallery({required this.event});


  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<Widget> createOtherEventsList(List<EventGallery> events){
    List<Widget> widgetList=[];
    for(int i=0; i<events.length;i++){
      widgetList.add(ImageContainer2(event: events[i]));
    }
    return widgetList;
  }
  File? _image;
  Future getImage(EventGallery myEvent)async{
    final image = await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemp = File(image.path);
    setState(() {
      _image= imageTemp;
      myEvent.images.add(FileImage(_image!));
    });
  }
  int index=0;

  @override
  Widget build(BuildContext context) {
    EventGallery myEvent = widget.event;
    myEvent.thumbnail;
    myEvent.description;

    return Scaffold(
        backgroundColor: Colors.red[900],
        body: SafeArea(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.chevron_left, color: Colors.white),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  myEvent.title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  DateFormat.yMMMMd('en_US').format(myEvent.date),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(height:50),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:Radius.circular(20)),
                    color: Colors.white
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation:5,
                        child: Container(
                            height:MediaQuery.of(context).size.height *0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: myEvent.images[index],
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.fitWidth,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(  color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      iconSize: 30,
                                      icon: Icon(Icons.chevron_left, color: Colors.white),
                                      onPressed: (){
                                        setState(() {
                                          if(index>0){
                                            index--;
                                          } else{
                                            index=myEvent.images.length-1;
                                          }

                                        });
                                      }
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(  color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(10)),

                                  child: IconButton(
                                      iconSize: 30,
                                      icon: Icon(Icons.chevron_right, color: Colors.white),
                                      onPressed: (){
                                          setState(() {
                                            if(index<myEvent.images.length-1){
                                              index++;
                                            } else{
                                              index=0;
                                            }
                                          });
                                      }
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Text("Description:", style:  TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left:30, right: 30),
                        child: Text(myEvent.description, style: TextStyle(fontSize:15, color: Colors.black),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          NewWidget(text: "Share on Twitter", color1: Colors.red[200]!, color2: Colors.red[900]!, onPressed:(){
                            SocialShare.shareTwitter(
                                "Check out ${myEvent.title} on the Glenelg High School App: ${myEvent.description}",
                                hashtags: ["${myEvent.date.year}"]);

                          },),
                          SizedBox(width:10),
                          NewWidget(text: "Add Images", color1: Colors.red[900]!, color2: Colors.white,onPressed: (){getImage(myEvent);},)
                        ],
                      ),
                    ),
                    SizedBox(height:30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Other Events:",style:  TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                          createOtherEventsList(Provider.of<AppData>(context).eventGalleryList)
                        ,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}


class NewWidget extends StatelessWidget {
  Color color1;
  Color color2;
  String text;
  Function onPressed;
  NewWidget({required this.text, required this.color1, required this.color2, required this.onPressed} );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
          onPressed: () {
            onPressed();
          },
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.075,
              padding: EdgeInsets.all(10),
              child: Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: TextStyle(color:color2),
                      ))),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color1,
              ),
            ),
          )),
    );
  }
}

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  String? text;
  String? title;
  DateTime _date = DateTime.now();
  ImageProvider<Object>? thumbnail;

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute));
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height*0.2,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Add Event",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Title"),
                        autofocus: true,
                        textAlign: TextAlign.center,
                        onChanged: (newText) {
                          title = newText;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                        ),
                        child: RawMaterialButton(
                          onPressed: () async {
                            final image = await ImagePicker().pickImage(source:ImageSource.gallery);
                            if(image==null){
                              return;
                            }
                            final imageTemp = File(image.path);
                            setState(() {
                              thumbnail =FileImage(imageTemp);
                            });
                          },
                          child: Center(
                            child: Text("Pick Thumbnail Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                      child: TextField(
                        maxLines: null,
                        autofocus: true,
                        decoration:
                        InputDecoration(hintText: "Event Details"),
                        textAlign: TextAlign.center,
                        onChanged: (newText) {
                          text = newText;
                        },
                      ),
                    ),
                    Center(
                      child: Text("Date",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red[900]),
                        child: RawMaterialButton(
                          onPressed: () async {
                            final date = await pickDate();
                            if (date == null) return;
                            _date = date;
                          },
                          child: Center(
                            child: Text(
                                "${DateFormat.yMd('en_US').format(_date)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RawMaterialButton(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                color: Colors.red[200],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RawMaterialButton(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                color: Colors.red[900],
                              ),
                              onPressed: () {
                                Provider.of<AppData>(context, listen: false)
                                    .addEventGallery(EventGallery(
                                  title: title!,
                                  description: text!,
                                  date: _date,
                                  thumbnail: thumbnail!,
                                  images: [thumbnail!],
                                ));
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

