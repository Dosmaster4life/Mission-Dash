import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class scores extends StatefulWidget {
  @override
  _scoresState createState() => _scoresState();
}

int vread = 0;
int quizzezComplete = 0;
_read() async {
  final prefs = await SharedPreferences.getInstance();
  int value2 = prefs.getInt("totalScore") ?? 0;
  int value3 = prefs.getInt("quizzesC") ?? 0;
  vread = value2;
  quizzezComplete = value3;
}

class _scoresState extends State<scores> {
  // Widget homeImg() {
  //return Container(
  //      height: MediaQuery.of(context).size.height / 2,
  //      child: Image.asset('assets/fight2.jpg'));
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _read();
    });
    Future.delayed(const Duration(milliseconds: 250), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Stats"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                  "Total Accumulated Score: " + vread.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                  "Quizzes Completed " + quizzezComplete.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
