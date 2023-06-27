import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:school_app/appData.dart';
import 'package:school_app/widgets.dart';
class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LogInScreen())
    );
  }
}



class LogInScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  bool isChecked = false;
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
                      Provider.of<AppData>(context, listen:false).changeEmail(value);
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
                      Provider.of<AppData>(context, listen:false).changePassword(value);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ))),
                Text(Provider.of<AppData>(context).signInError,
                    style: const TextStyle(
                        color: Colors.red
                    )),
            SizedBox(height: 30),
            LargeTextButton(
                text: 'Login',
                textColor: Colors.white,
                color: Colors.red[900]!,
                onPressed: () async {
                  try{
                    final newUser = await _auth.signInWithEmailAndPassword(email: Provider.of<AppData>(context, listen: false).getEmail(), password: Provider.of<AppData>(context, listen: false).getPassword());
                    if(newUser!=null){
                      Navigator.pushNamedAndRemoveUntil(context,"MainScreen", (_)=> false);
                    }

                  }on FirebaseAuthException catch(e){
                    Provider.of<AppData>(context,listen:false).changeSignInError("Invalid email or password! Please try again.");
                  } catch(e){
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
                    },
                    child: Text('Contact Your School Admin!',
                        style: TextStyle(
                            color: Colors.red[900],
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

