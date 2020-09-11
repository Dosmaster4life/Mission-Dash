import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'Alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flame/animation.dart'
    as animation; // imports the Animation class under animation.Animation
import 'package:flame/flame.dart'; // imports the Flame helper class
import 'package:flame/position.dart'; // imports the Position class

class game extends StatefulWidget {
  @override
  _gameState createState() => _gameState();
}

int qNum = 0;
String qText = "Question";
String aText = "A";
String bText = "B";
String cText = "C";
String dText = "D";
var selectedAnswer = 0;
var randOmized = new List<int>.generate(4, (i) => i);
var loadedQuiz = false;
String rAnswer = "";
int score = 0;
Color defaultbtnA = Colors.blue[500];
Color defaultbtnB = Colors.blue[500];
Color defaultbtnC = Colors.blue[500];
Color defaultbtnD = Colors.blue[500];
Color rightbtn = Colors.green[300];
Color wrongbtn = Colors.red[300];
Color resetbtn = Colors.blue[500];
var jData;
List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

void restartQuiz() {
  check();
  score = 0;
  qNum = 0;
  selectedAnswer = 0;
  loadedQuiz = false;
  // _loadJsonAsset();
  loadJson();
}

var pathS = "assets2/PMG1.json";
void loadString(String path) {
  pathS = path.replaceAll("%20", " ").replaceAll("(", "").replaceAll(")", "");
}

Future<String> _loadJsonAsset() async {
  return await rootBundle.loadString(pathS);
}

void loadAsset() {
  Future loadJson() async {
    String jsonData = await _loadJsonAsset();
  }
}

Future loadJson() async {
  if (loadedQuiz == false) {
    String jsonData = await _loadJsonAsset();
    Map<String, dynamic> user = jsonDecode(jsonData);
    jData = jsonSerial.fromJson(user);

    loadedQuiz = true;

    // setValues();
    shuffle(jData.questions);
  }

  setValues();
  // });

  //print(x.questions[0].question);
}

var aList = {aText, bText, cText, dText};
void check() {
  print(aText);
  print(rAnswer);
  if (aText == rAnswer) {
    defaultbtnA = rightbtn;
    if (selectedAnswer == 1) {
      score += 100;
    }
  } else if (bText == rAnswer) {
    defaultbtnB = rightbtn;
    if (selectedAnswer == 2) {
      score += 100;
    }
  } else if (cText == rAnswer) {
    defaultbtnC = rightbtn;
    if (selectedAnswer == 3) {
      score += 100;
    }
  } else if (dText == rAnswer) {
    defaultbtnD = rightbtn;
    if (selectedAnswer == 4) {
      score += 100;
    }
  }
  if (aText != rAnswer) {
    if (selectedAnswer == 1) {
      defaultbtnA = wrongbtn;
    }
  }
  if (bText != rAnswer) {
    if (selectedAnswer == 2) {
      defaultbtnB = wrongbtn;
    }
  }
  if (cText != rAnswer) {
    if (selectedAnswer == 3) {
      defaultbtnC = wrongbtn;
    }
  }
  if (dText != rAnswer) {
    if (selectedAnswer == 4) {
      defaultbtnD = wrongbtn;
    }
  }
}

int v = 0;
void setValues() {
  //setState(() {
  defaultbtnA = Colors.blue[500];
  defaultbtnB = Colors.blue[500];
  defaultbtnC = Colors.blue[500];
  defaultbtnD = Colors.blue[500];
  int ra = jData.questions[qNum].correctAnswer - 1;
  rAnswer = jData.questions[qNum].answers[ra];
  print(rAnswer);
  // shuffle(randOmized);
  //print(randOmized);
  qText = jData.questions[qNum].question;
  aText = jData.questions[qNum].answers[randOmized[0]];
  bText = jData.questions[qNum].answers[randOmized[1]];
  cText = jData.questions[qNum].answers[randOmized[2]];
  dText = jData.questions[qNum].answers[randOmized[3]];
  aList = {aText, bText, cText, dText};
  qNum += 1;
  print(qNum);
  v = jData.questions.length / 3;

  print(qNum);
  print(v);
}

Future updateData() async {}

var allData;
void main() async {}

class _gameState extends State<game> {
  Widget homeImg() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Image.asset('assets/fight.jpg'));
  }

  Widget qestion() {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: SizedBox(
        width: 300,
        height: 125,
        child: Align(
          alignment: Alignment.center,
          child: AutoSizeText(qText,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        ),
      ),
    );
  }

  Widget scoreSystem() {
    return Container(
      child: Align(
        alignment: Alignment.topRight,
        child: AutoSizeText("Score: " + score.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue[500])),
      ),
    );
  }

  Widget scoreSystem2() {
    return Container(
      child: Align(
        alignment: Alignment.topRight,
        child: AutoSizeText(
            "Question " + (qNum).toString() + "/" + v.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue[500])),
      ),
    );
  }

  Widget btnA() {
    var btnColor = Colors.blue;

    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: defaultbtnA,
          textColor: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              aText,
              style: new TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
          onPressed: () => {
            if (selectedAnswer == 0)
              {
                setState(() {
                  selectedAnswer = 1;
                  //loadJson();
                  check();
                }),
              }
          },
          splashColor: Colors.redAccent,
        ));
  }

  Widget btnB() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: defaultbtnB,
          textColor: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              bText,
              style: new TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
          onPressed: () => {
            if (selectedAnswer == 0)
              {
                setState(() {
                  selectedAnswer = 2;
                  //loadJson();
                  check();
                })
              }
          },
          splashColor: Colors.redAccent,
        ));
  }

  Widget btnC() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: defaultbtnC,
          textColor: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              cText,
              style: new TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
          onPressed: () => {
            if (selectedAnswer == 0)
              {
                setState(() {
                  selectedAnswer = 3;
                  //loadJson();
                  check();
                })
              }
          },
          splashColor: Colors.redAccent,
        ));
  }

  Widget btnD() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: defaultbtnD,
          textColor: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              dText,
              style: new TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
          onPressed: () => {
            if (selectedAnswer == 0)
              {
                setState(() {
                  selectedAnswer = 4;
                  //loadJson();
                  check();
                })
              }
          },
          splashColor: Colors.redAccent,
        ));
  }

  Widget gameEngine() {}
  bool finished = false;
  Widget btnStart() {
    var btnColor = Colors.blue;
    return Padding(
        padding: EdgeInsets.all(7.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 10,
          elevation: 10,
          color: Colors.yellow[500],
          textColor: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              "Next",
              style: new TextStyle(
                color: Colors.blue[500],
              ),
            ),
          ),
          onPressed: () => {
            if (selectedAnswer != 0)
              {
                if (qNum >= v)
                  {
                    //qNum = 0;
                    _read(),
                    if (vread > score)
                      {}
                    else
                      {
                        _save(),
                      },
                    if (finished)
                      {}
                    else
                      {
                        showAlertDialog(
                            context,
                            "Your Score: " +
                                score.toString() +
                                "\n High Score: " +
                                vread.toString(),
                            "Mission Dash",
                            "Play Another",
                            "Home"),
                        finished = true,
                      },
                  },
                setState(() {
                  loadJson();
                  selectedAnswer = 0;
                }),
                print("Test")
              },
          },
          splashColor: Colors.redAccent,
        ));
  }

  void startProgram() {
    print("Program Started@");
  }

  @override
  Widget build(BuildContext context) {
    //SchedulerBinding.instance.addPostFrameCallback((_) => startProgram());
    Future.delayed(const Duration(milliseconds: 250), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          scoreSystem2(),
          scoreSystem(),
          qestion(),
          btnA(),
          btnB(),
          btnC(),
          btnD(),
          btnStart(),
        ],
      ),
    );
  }
}

class jsonSerial {
  List<Questions> questions;

  jsonSerial({this.questions});

  jsonSerial.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int number;
  String question;
  List<String> answers;
  int correctAnswer;

  Questions({this.number, this.question, this.answers, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    question = json['question'];
    answers = json['answers'].cast<String>();
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['question'] = this.question;
    data['answers'] = this.answers;
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

int vread = 0;
int vwrite = 0;
_read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = pathS;
  final value = prefs.getInt(key) ?? 0;
  print('read: $value');
  vread = value;
}

_save() async {
  final prefs = await SharedPreferences.getInstance();
  final key = pathS;
  final value = score;

  final key2 = "totalScore";

  int value2 = prefs.getInt("totalScore") ?? 0;
  int value3 = prefs.getInt("quizzesC") ?? 0;
  prefs.setInt("quizzesC", value3 + 1);
  prefs.setInt(key2, value2 + score);

  prefs.setInt(key, value);
  print('saved $value');
  vwrite = value;
}
