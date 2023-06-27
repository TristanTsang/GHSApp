import 'package:flutter/material.dart';
import 'package:school_app/screens/startScreen.dart';
import '../models.dart';
import '../widgets.dart';
import 'administratorInboxScreen.dart';
import 'announcements.dart';
import 'package:provider/provider.dart';
import 'emailScreen.dart';
import 'event.dart';
import 'package:school_app/appData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'imageScreen.dart';
import 'package:school_app/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey[100],
                radius: MediaQuery.of(context).size.width * 0.1,
                backgroundImage: AssetImage("images/glenelghs.png"),
                child: RawMaterialButton(
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "${Provider.of<AppData>(context).name}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "${Provider.of<AppData>(context).email}",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.settings),
                  SizedBox(width: 30),
                  Text("Settings"),
                ],
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountManagementScreen()));
              },
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.admin_panel_settings),
                  SizedBox(width: 30),
                  Text("Account Management"),
                ],
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdministratorInboxScreen()));
              },
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.inbox),
                  SizedBox(width: 30),
                  Text("Administrator Contact"),
                ],
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'StartScreen');
              },
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.logout),
                  SizedBox(width: 30),
                  Text("Log Out"),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Glenelg Highschool",
        ),
        backgroundColor: Colors.red[900],
      ),
      bottomNavigationBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text("Welcome Glenelg Gladiators!",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800))),
            Image(
                image: AssetImage("images/glenelghs.png"),
                width: MediaQuery.of(context).size.width * 0.5),
            Material(
              elevation: 5,
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Recent Announcements",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.2,
              child: SingleChildScrollView(
                child: Column(
                  children: Provider.of<AppData>(context).announcementWidgets(
                      Provider.of<AppData>(context).recentAnnouncements()),
                ),
              ),
            ),
            SizedBox(height: 30),
            Material(
              elevation: 5,
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Upcoming Events",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Provider.of<AppData>(context).eventWidgetsSpaced(
                      Provider.of<AppData>(context).eventArray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({Key? key}) : super(key: key);

  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red[900],
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return AddAccountScreen();
                });
          },
        ),
      ),
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
                      child: Text("Account Management",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                )),
            SizedBox(height: 20),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                  children:
                      AccountList(Provider.of<AppData>(context).accountData)),
            ))
          ],
        ),
      ),
    );
  }

  List<Widget> AccountList(List<Account> data) {
    List<Widget> widgets = [];
    for (int i = 0; i < data.length; i++) {
      var current = data[i];
      widgets.add(RawMaterialButton(
        onPressed: () {},
        onLongPress: () {
          setState(() {
            Provider.of<AppData>(context, listen: false)
                .accountData
                .remove(data[i]);
          });
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
                  CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 40,
                      backgroundImage: current.avatar),
                  SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${current.name}:",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Type: ${current.type}",
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
}

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email;
    String? name;
    String? password;
    String? type;
    final _auth = FirebaseAuth.instance;
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Create New Account!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const Text('Enter the following information to create the account!',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 50),
            const Text('Email*', style: TextStyle(fontSize: 17)),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50]),
                padding: EdgeInsets.all(10),
                child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ))),
                SizedBox(height: 25,),
                const Text('Name*', style: TextStyle(fontSize: 17)),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50]),
                padding: EdgeInsets.all(10),
                child: TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ))),
            SizedBox(height: 25),
            const Text('Password*', style: TextStyle(fontSize: 17)),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50]),
                padding: EdgeInsets.all(10),
                child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ))),
            Text(Provider.of<AppData>(context).signUpError,
                style: const TextStyle(color: Colors.red)),
            SizedBox(height: 30),
            LargeTextButton(
                text: 'Create Account',
                textColor: Colors.white,
                color: Colors.red[900]!,
                onPressed: () async {
                  try {
                    Account newAccount = Account(
                        avatar: AssetImage("images/glenelghs.png"),
                        name: name!,
                        email: email!,
                        type: "member",
                        password: password!);
                    Provider.of<AppData>(context).accountData.add(newAccount);
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    if (newUser != null) {
                      Navigator.pop(context);
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ]),
        ),
      ),
    );
  }
}
