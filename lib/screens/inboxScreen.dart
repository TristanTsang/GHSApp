import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';
import '../widgets.dart';
import 'announcements.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  String? text;
  String? title;
  OverlayEntry? overlayEntry;
  void createOverlay() {
    // Remove the existing OverlayEntry.
    removeHighlightOverlay();

    assert(overlayEntry == null);
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
        backgroundColor: Colors.red[900],
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              SizedBox(
                  height: 60,
                  child: Center(
                    child: Text("Add Announcement",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(7.5),
                      bottomRight: Radius.circular(7.5),
                    ),
                  ),
                  child: Column(
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
                        child: TextField(
                          maxLines: null,
                          autofocus: true,
                          decoration:
                              InputDecoration(hintText: "Announcement Details"),
                          textAlign: TextAlign.center,
                          onChanged: (newText) {
                            text = newText;
                          },
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
                                  removeHighlightOverlay();
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
                                      .addAnnouncement(Announcement(
                                    text: text!,
                                    date: DateTime.now(),
                                    title: title!,
                                  ));
                                  removeHighlightOverlay();
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
    });
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.all(10),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.red[900],
            onPressed: () {
              createOverlay();
            },
          ),
        ),
        bottomNavigationBar: myAppBar(),
        appBar: AppBar(
          title: Text(
            "Announcements Inbox",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: Provider.of<AppData>(context).announcementWidgets(
              Provider.of<AppData>(context).announcementArray),
        )));
  }

  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    text = null;
    title = null;
  }

  @override
  void dispose() {
    // Make sure to remove OverlayEntry when the widget is disposed.
    removeHighlightOverlay();
    super.dispose();
  }
}