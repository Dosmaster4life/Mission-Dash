import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Game.dart';
import 'Home.dart';
import 'qLoader.dart';

showAlertDialog(BuildContext context, String message, String heading,
    String buttonAcceptTitle, String buttonCancelTitle) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(buttonCancelTitle),
    onPressed: () {
      restartQuiz();
          

      Navigator.of(context).popUntil((route) => route.isFirst);
    },
  );
  Widget continueButton = FlatButton(
    child: Text(buttonAcceptTitle),
    onPressed: () {
      restartQuiz();

      Navigator.pop(context);
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(heading),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
