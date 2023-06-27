import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {Navigator.pushReplacementNamed(context, "InboxScreen");},
              icon: Icon(Icons.inbox, color:  (ModalRoute.of(context)?.settings.name == 'InboxScreen')?Colors.red[900]:Colors.grey[800], size: 30),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {Navigator.pushReplacementNamed(context, "EventsScreen");},
              icon: Icon(Icons.calendar_month, color:  (ModalRoute.of(context)?.settings.name == 'EventsScreen')?Colors.red[900]:Colors.grey[800], size: 30),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.home, color: (ModalRoute.of(context)?.settings.name == 'MainScreen')?Colors.red[900]:Colors.grey[800] , size: 35),
              onPressed: () {Navigator.pushReplacementNamed(context, 'MainScreen');},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {Navigator.pushReplacementNamed(context, ('ImageScreen'));},
              icon: Icon(Icons.photo_camera, color: (ModalRoute.of(context)?.settings.name == 'ImageScreen')?Colors.red[900]:Colors.grey[800] , size: 30),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {Navigator.pushReplacementNamed(context, ('EmailScreen'));},
              icon: Icon(Icons.mail, color: (ModalRoute.of(context)?.settings.name == 'EmailScreen')?Colors.red[900]:Colors.grey[800], size: 30),
            ),
          ],
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