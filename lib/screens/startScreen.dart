import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image(image: AssetImage("images/glenelghs.png")),
              Text("Glenelg High School App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white)),
              Text(
                "App Of The Gladiators",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              LargeTextButton(
                text: 'Sign up',
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SignUpScreen();
                      });
                },
                color: Colors.red[900]!,
                textColor: Colors.white,
              ),
              LargeTextButton(
                  text: 'Login',
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return LogInScreen();
                        });
                  },
                  color: Colors.grey[800]!,
                  textColor: Colors.white),
            ],
          ),
        ],
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

class LogInScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  bool isChecked = false;
  late String email;
  late String password;
  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Welcome back!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('Enter your information to access the app!',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            SizedBox(height: 75),
            Text('Email*', style: TextStyle(fontSize: 17)),
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
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ))),
            SizedBox(height: 25),
            Text('Password*', style: TextStyle(fontSize: 17)),
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
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ))),
            SizedBox(height: 30),
            LargeTextButton(
                text: 'Login',
                textColor: Colors.white,
                color: Color(0xff10182b),
                onPressed: () async {
                  try{
                    final newUser = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                    if(newUser!=null){
                      print("hi");
                      Navigator.pushNamed(context,"MainScreen");
                    }

                  }catch(e){
                    print(e);
                  }
                }),
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Don\'t have any account?',
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SignUpScreen();
                          });
                    },
                    child: Text('Sign Up!',
                        style: TextStyle(
                            color: Color(0xff10182b),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold))),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  bool isChecked = true;
  late String email;
  late String password;
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Welcome!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('Enter your information to access the app!',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            SizedBox(height: 50),
            Text('Email*', style: TextStyle(fontSize: 17)),
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
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ))),
            SizedBox(height: 25),
            Text('Password*', style: TextStyle(fontSize: 17)),
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
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ))),
            SizedBox(height: 25),
            SizedBox(height: 30),
            LargeTextButton(
                text: 'Sign up',
                textColor: Colors.white,
                color: Colors.deepOrange,
                onPressed: () async {try{
                  print(email);
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
                  if(newUser!=null){
                    Navigator.pushNamed(context,"MainScreen");
                  }

                }catch(e){
                  print(e);
                }
                }),
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Already have an account?',
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return LogInScreen();
                          });
                    },
                    child: Text('Log in!',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold))),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
