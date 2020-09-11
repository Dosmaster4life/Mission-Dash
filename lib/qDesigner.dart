import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class qDesigner extends StatefulWidget {
  @override
  _qDesignerState createState() => _qDesignerState();
}

class _qDesignerState extends State<qDesigner> {
  Widget homeImg() {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Image.asset('assets/fight2.jpg'));
  }

  Map<String, dynamic> j;

  createJson() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qDesigner"),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          children: [
            QuestionNumber(),
            txtformq(),
            txtforma(),
            txtformb(),
            txtformc(),
            txtformd(),
            btnRows(),
          ],
        ),
      ),
    );
  }
}

Widget btnRows() {
  return Row(
    children: [
      Padding(
          padding: EdgeInsets.all(7.0),
          child: MaterialButton(
              onPressed: () {}, //
              height: 50,
              elevation: 10,
              color: Colors.blue[500],
              textColor: Colors.white,
              child: Align(
                alignment: Alignment.topRight,
                child: AutoSizeText("Back",
                    style: new TextStyle(
                      color: Colors.yellow,
                    )),
              ))),
      Expanded(
        child: Container(),
      ),
      Padding(
          padding: EdgeInsets.all(7.0),
          child: MaterialButton(
              onPressed: () {}, //
              height: 50,
              elevation: 10,
              color: Colors.blue[500],
              textColor: Colors.white,
              child: Align(
                alignment: Alignment.topLeft,
                child: AutoSizeText("Next",
                    style: new TextStyle(
                      color: Colors.yellow,
                    )),
              )))
    ],
  );
}

Widget QuestionNumber() {
  return Container(
    child: Align(
      alignment: Alignment.topRight,
      child: AutoSizeText("1/1",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[500])),
    ),
  );
}

Widget txtformq() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Question:'),
    keyboardType: TextInputType.multiline,
    maxLines: null,
  );
}

Widget txtforma() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'A'),
    keyboardType: TextInputType.multiline,
    maxLines: null,
  );
}

Widget txtformb() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'B'),
    keyboardType: TextInputType.multiline,
    maxLines: null,
  );
}

Widget txtformc() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'C'),
    keyboardType: TextInputType.multiline,
    maxLines: null,
  );
}

Widget txtformd() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'D'),
    keyboardType: TextInputType.multiline,
    maxLines: null,
  );
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
