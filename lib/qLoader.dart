import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mission/Scores.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';
import 'Game.dart';
import 'Scores.dart';
import 'package:file_picker/file_picker.dart';

class quizl extends StatefulWidget {
  @override
  _quizlState createState() => _quizlState();
}

List<String> l;

class _quizlState extends State<quizl> {
  @override
  Widget build(context) {
    return FutureBuilder<dynamic>(
        future: main(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var b = snapshot.data.toString().split(", ");
            return Scaffold(
                appBar: AppBar(
                  title: Text("Quiz Picker"),
                  centerTitle: true,
                ),
                body: ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(7.0),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height / 10,
                          elevation: 10,
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: new Text(
                            "Upload your own!<Not Functional yet>",
                            style: new TextStyle(
                              fontSize: 30.0,
                              color: Colors.yellow,
                            ),
                          ),
                          onPressed: () => {getFile()},
                          splashColor: Colors.redAccent,
                        )),
                    for (var name in b)
                      Padding(
                          padding: EdgeInsets.all(7.0),
                          child: MaterialButton(
                            height: MediaQuery.of(context).size.height / 10,
                            elevation: 10,
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            child: AutoSizeText(
                              name
                                  .replaceAll("assets2/", "")
                                  .replaceAll(".json", "")
                                  .replaceAll("%20", " ")
                                  .replaceAll("(", "")
                                  .replaceAll(")", ""),
                              style: new TextStyle(
                                fontSize: 30.0,
                                color: Colors.yellow,
                              ),
                            ),
                            onPressed: () => {
                              loadString(name),
                              restartQuiz(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => game(),
                                  ))
                            },
                            splashColor: Colors.redAccent,
                          )),
                  ],
                ));
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  main() async {
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final files = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith('assets2/'));
    // var x = files.toString().split(", ");
    return files.toString();
    // List<Widget> widgets = x.map((name) => new Text(name)).toList();
  }
}

String jFile;
void getFile() async {
  File file = await FilePicker.getFile();
  String j = file.readAsStringSync();
  jFile = j;
  print(jFile);
  _save();
}

_save() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> valueLoad = prefs.getStringList("jsonStorage") ?? 0;
  if (valueLoad == 0) {
    prefs.setStringList("jsonStorage", [jFile]);
  } else {
    valueLoad.addAll([jFile]);

    //prefs.setStringList("jsonStorage", [valueLoad, jFile]);
    prefs.setStringList("jsonStorage", valueLoad);
  }
  print(valueLoad[6]);
}

_read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = "jsonStorage";
  List<String> value = prefs.getStringList(key) ?? 0;
  l = value;
}
