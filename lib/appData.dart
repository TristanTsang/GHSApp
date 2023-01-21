import 'package:school_app/screens/event.dart';
import 'package:school_app/screens/announcements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class AppData extends ChangeNotifier {
  AppData() {}
  List<Event> eventArray = [
   Event(
    description: "Its finally that time of year. Have a great time Juniors and Seniors!",
    startTime: DateTime(0,0,0,12,30),
    endTime:DateTime(0,0,0,14,30),
    title:"Prom", eventDate: DateTime(2023,3,21),
  ),
    Event(
      description: "Professional Work Day. Students have off. Enjoy the time with friends and family, getting rest, or getting ahead with work!",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"No School!", eventDate: DateTime(2023,1,23),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"FBLA", eventDate: DateTime(2023,1,21),
    ),
    Event(
      description: "Happy new year! The year of the rabbit is approaching. Come join the Lunar New Year potluck! The event takes place on Friday, January 20 from 5 PM-7 PM in the cafeteria. Try foods from different places that celebrate Lunar New Year. Play games inspired by different Asian cultures. Free admission! All are welcome!",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Lunar New Year", eventDate: DateTime(2023,1,20),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Winter Break!", eventDate: DateTime(2023,12,19),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Example Event", eventDate: DateTime(2023,12,19),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Example Event", eventDate: DateTime(2023,12,19),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Example Event", eventDate: DateTime(2023,12,19),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Example Event", eventDate: DateTime(2023,12,19),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Example Event", eventDate: DateTime(2023,12,19),
    ),
    Event(
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0,0,0,12,30),
      endTime:DateTime(0,0,0,14,30),
      title:"Example Event", eventDate: DateTime(2023,12,19),
    ),

  ];

  void addEvent(Event event) {
    eventArray.add(event);
  }

  List<Announcement> announcementArray = [
    Announcement(
        date: DateTime(
          2023,
          1,
          21,
        ),
        title: 'Spirit Week',
        text:
            "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          20,
        ),
        title: 'Prom Tickets',
        text:
            "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          19,
        ),
        title: 'Spirit Week',
        text:
            "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          18,
        ),
        title: 'Prom Tickets',
        text:
            "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          17,
        ),
        title: 'Spirit Week',
        text:
            "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          16,
        ),
        title: 'Prom Tickets',
        text:
            "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          15,
        ),
        title: 'Spirit Week',
        text:
            "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          14,
        ),
        title: 'Prom Tickets',
        text:
            "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          13,
        ),
        title: 'Spirit Week',
        text:
        "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          12,
        ),
        title: 'Prom Tickets',
        text:
        "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          11,
        ),
        title: 'Spirit Week',
        text:
        "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          10,
        ),
        title: 'Prom Tickets',
        text:
        "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          9,
        ),
        title: 'Spirit Week',
        text:
        "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          8,
        ),
        title: 'Prom Tickets',
        text:
        "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
    Announcement(
        date: DateTime(
          2023,
          1,
          7,
        ),
        title: 'Spirit Week',
        text:
        "Hey Gladiators, I hope everyone is excited for a great spirit week! Monday, Dec. 19: Combo event! Pajama and/or Blanket Out day  \nTuesday, Dec. 20: Adam Sandler day \nWednesday, Dec. 21: Bikers (juniors/seniors) vs. Surfers (freshmen/sophomores)\nThursday, Dec. 22: Flannel day\n"),
    Announcement(
        date: DateTime(
          2023,
          1,
          6,
        ),
        title: 'Prom Tickets',
        text:
        "Buy your tickets on the GHS Website or in person during all lunch shifts. Tickets will not be sold past Tuesday of next week!"),
  ];

  List<Announcement> recentAnnouncements() {
    List<Announcement> temp1 = new List<Announcement>.from(announcementArray);
    List<Announcement> temp2 = [];
    for (int k = 0; k < 3; k++) {
      Announcement mostRecent = temp1[0];
      for (int i = 0; i < temp1.length; i++) {

        if (mostRecent.date.isBefore(temp1[i].date)) {
          mostRecent = temp1[i];
          print(mostRecent.date.day);
        }

      }
      temp2.add(mostRecent);
      temp1.remove(mostRecent);

    }
    return temp2;
  }

  List<Widget> announcementWidgets(List<Announcement> announcements){
    List<Widget> temp = [];
    print(announcements.length);
    for(int i=0; i< announcements.length;i++){
      temp.add(AnnouncementCard(announcement: announcements[i]));
      temp.add(Divider(thickness:1));
    }
    return temp;
  }

  List<Widget> eventWidgets(List<Event> events){
    List<Widget> temp = [];
    for(int i=0; i< events.length;i++){
      temp.add(EventTile2(event: events[i]));
    }
    return temp;
  }
  List<Widget> eventWidgetsSpaced(List<Event> events){
    List<Widget> temp = [];
    for(int i=0; i< events.length;i++){
      temp.add(EventTile(event: events[i]));
      temp.add(SizedBox(width:10));
    }
    return temp;
  }

  void addAnnouncement(Announcement announcement) {
    announcementArray.add(announcement);
    notifyListeners();
  }
}
