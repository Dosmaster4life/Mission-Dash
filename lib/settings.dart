import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  Widget homeImg() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Image.asset('assets/fight2.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[homeImg()],
      ),
    );
  }
}
