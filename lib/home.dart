import 'package:flutter/material.dart';
import 'package:mission/Scores.dart';
import 'package:mission/qDesigner.dart';
import 'settings.dart';
import 'Game.dart';
import 'Scores.dart';
import 'qLoader.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget startbutton() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: new Text(
            "Start",
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.yellow,
            ),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => quizl()),
            )
          },
          splashColor: Colors.redAccent,
        ));
  }

  Widget settingsbutton() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: new Text(
            "Quiz Designer",
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.yellow,
            ),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => qDesigner()),
            )
          },
          splashColor: Colors.redAccent,
        ));
  }

  Widget Stats() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: new Text(
            "Stats",
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.yellow,
            ),
          ),
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => scores(),
                ))
          },
          splashColor: Colors.redAccent,
        ));
  }

  // Widget homeImg() {
  // return Container(
  //  height: MediaQuery.of(context).size.height / 2.75,
  // child: Image.asset('assets/Warrior.jpeg'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission Dash"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[startbutton(), Stats(), settingsbutton()],
      ),
    );
  }
}
