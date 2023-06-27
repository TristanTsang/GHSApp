import 'dart:collection';

import 'package:school_app/screens/emailScreen.dart';
import 'package:school_app/screens/event.dart';
import 'package:school_app/screens/announcements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'models.dart';

class AppData extends ChangeNotifier {
  ///Bug Report Data
  List<BugReport> bugReportData = [
    BugReport(
        email: "tristantsang9786@gmail.com",
        subject: "App Crashes",
        description: "Whenever I press the inbox button the app crashes"),
    BugReport(
        email: "tristantsang9786@gmail.com",
        subject: "Invisible Button",
        description: "The home button is invisible"),
    BugReport(
        email: "tristantsang9786@gmail.com",
        subject: "Help!",
        description: "Whenever I press the inbox button the app crashes"),
    BugReport(
        email: "tristantsang9786@gmail.com",
        subject: "No Errors :D",
        description: "No errors haha!"),
  ];

  addBugReport(BugReport data) {
    bugReportData.insert(0, data);
  }

  ///Absences Data
  List<AbsenceReport> absenceReportData = [
    AbsenceReport(
        email: "tristantsang9786@gmail.com",
        name: "Tristan Tsang",
        reason: "Sick",
        description:
            "Tristan is out with the flu today sorry for the inconvenience"),
    AbsenceReport(
        email: "tristantsang9786@gmail.com",
        name: "James Peng",
        reason: "Appointment",
        description:
            "Tristan is out with the flu today sorry for the inconvenience"),
    AbsenceReport(
        email: "tristantsang9786@gmail.com",
        name: "Srikar Erigineni",
        reason: "Other",
        description:
            "Tristan is out with the flu today sorry for the inconvenience"),
  ];

  addAbsenceReport(AbsenceReport data) {
    absenceReportData.insert(0, data);
  }

  ///Event Gallery Data
  List<EventGallery> eventGalleryList = [
    EventGallery(
        title: "Pep Rally 2023",
        thumbnail: AssetImage('images/pepRally10.jpg'),
        description:
            "An amazing show of Glenelg school spirit celebrating our many athletes and musicians. Let's make it a great year, Glenelg!",
        date: DateTime(2023, 10, 14),
        images: [
          AssetImage('images/pepRally10.jpg'),
          AssetImage('images/pepRally1.jpg'),
          AssetImage('images/pepRally3.jpg'),
          AssetImage('images/pepRally4.jpg'),
          AssetImage('images/pepRally5.jpg'),
          AssetImage('images/pepRally6.jpg'),
          AssetImage('images/pepRally7.jpg'),
          AssetImage('images/pepRally8.jpg'),
          AssetImage('images/pepRally9.jpg'),
          AssetImage('images/pepRally11.jpg'),
          AssetImage('images/pepRally12.jpg')
        ]),
    EventGallery(
        title: "Senior Hot Chocolate!",
        thumbnail: AssetImage('images/hotchoc.jpg'),
        description:
        "Let's celebrate glenelg's seniors with some nice hot chocolate!!",
        date: DateTime(2023, 10, 14),
        images: [
          AssetImage('images/hotchoc3.jpg'),
          AssetImage('images/hotchoc1.jpg'),
          AssetImage('images/hotchoc2.jpg'),


        ])
  ];
  void addEventGallery(EventGallery eventGallery) {
    eventGalleryList.add(eventGallery);
    notifyListeners();
  }

  ///Event Data
  //Initial Events
  List<Event> eventArray = [
    Event(
      description:
      "Its finally time to celebrate FBLA and all its winners congrats everyone!",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "FBLA Awards",
      eventDate: DateTime(2023, 6, 30),
    ),
    Event(
      description:
          "Its finally that time of the year. Have a great time Juniors and Seniors!",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Prom",
      eventDate: DateTime(2023, 3, 21),
    ),
    Event(
      description:
          "Professional Work Day. Students have off. Enjoy the time with friends and family, getting rest, or getting ahead with work!",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "No School!",
      eventDate: DateTime(2023, 1, 23),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "FBLA",
      eventDate: DateTime(2023, 1, 21),
    ),
    Event(
      description:
          "Happy new year! The year of the rabbit is approaching. Come join the Lunar New Year potluck! The event takes place on Friday, January 20 from 5 PM-7 PM in the cafeteria. Try foods from different places that celebrate Lunar New Year. Play games inspired by different Asian cultures. Free admission! All are welcome!",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Lunar New Year",
      eventDate: DateTime(2023, 1, 20),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Winter Break!",
      eventDate: DateTime(2023, 12, 19),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Example Event",
      eventDate: DateTime(2023, 12, 19),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Example Event",
      eventDate: DateTime(2023, 12, 19),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Example Event",
      eventDate: DateTime(2023, 12, 19),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Example Event",
      eventDate: DateTime(2023, 12, 19),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Example Event",
      eventDate: DateTime(2023, 12, 19),
    ),
    Event(
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
      startTime: DateTime(0, 0, 0, 12, 30),
      endTime: DateTime(0, 0, 0, 14, 30),
      title: "Example Event",
      eventDate: DateTime(2023, 12, 19),
    ),
  ];
  LinkedHashMap<DateTime, List<Event>> eventsMap = LinkedHashMap(
    equals: isSameDay,
    hashCode: (DateTime date) {
      return date.day * 1000000 + date.month * 10000 + date.year;
    },
  );

  void addEvent(Event event) {
    eventArray.add(event);
    updateEventMap(eventArray);
    notifyListeners();
  }

  void updateEventMap(List<Event> events) {
    eventsMap.clear();
    for (Event item in events) {
      if (eventsMap[item.eventDate] != null) {
        eventsMap[item.eventDate]!.add(item);
      } else {
        eventsMap[item.eventDate] = [];
        eventsMap[item.eventDate]!.add(item);
      }
    }
    notifyListeners();
  }

  List<Widget> eventWidgets(List<Event> events) {
    List<Widget> temp = [];
    for (int i = 0; i < events.length; i++) {
      temp.add(EventTile2(event: events[i]));
    }
    return temp;
  }

  List<Widget> eventWidgetsSpaced(List<Event> events) {
    List<Widget> temp = [];
    for (int i = 0; i < events.length; i++) {
      temp.add(EventTile(event: events[i]));
      temp.add(SizedBox(width: 10));
    }
    return temp;
  }

  /// Announcement Data
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
    List<Announcement> temp1 = List<Announcement>.from(announcementArray);
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

  List<Widget> announcementWidgets(List<Announcement> announcements) {
    List<Widget> temp = [];
    for (int i = 0; i < announcements.length; i++) {
      temp.insert(0, AnnouncementCard(announcement: announcements[i]));
      temp.insert(1, Divider(thickness: 1));
    }
    return temp;
  }

  void addAnnouncement(Announcement announcement) {
    announcementArray.insert(0, announcement);
    notifyListeners();
  }

  //* UserData *//

  String? email;
  String? name = "Tristan Tsang";
  String? password;
  String signUpError = "";
  String signInError = "";
  Account currentAccount = Account(
      avatar: AssetImage("images/glenelghs.png"),
      email: "tristantsang9786@gmail.com",
      name: "Tristan Tsang",
      type: "Admin",
      password: "123456");

  List<Account> accountData = [
    Account(
        avatar: AssetImage("images/glenelghs.png"),
        email: "tristantsang9786@gmail.com",
        name: "Tristan Tsang",
        type: "Admin",
        password: "123456"),
    Account(
        avatar: AssetImage("images/srikar.jpg"),
        email: "srikar.erig@gmail.com",
        name: "Srikar Erigineni",
        type: "member",
        password: "123456"),
    Account(
        avatar: AssetImage("images/moisesZ.png"),
        email: "moiseszelaya@gmail.com",
        name: "Moises Zelaya",
        type: "member",
        password: "123456"),
    Account(
        avatar: AssetImage("images/katherineD.png"),
        email: "katherinedelaney@gmail.com",
        name: "Katherine Delaney",
        type: "member",
        password: "123456"),
  ];

  void changeEmail(String newEmail) {
    email = newEmail;
    currentAccount.email = newEmail;
    notifyListeners();
  }

  void changePassword(String newPassword) {
    currentAccount.password = newPassword;
    password = newPassword;
    notifyListeners();
  }

  String getEmail() {
    return email!;
  }

  String getPassword() {
    return password!;
  }

  void changeSignInError(String error) {
    signInError = error;
    notifyListeners();
  }
}
