// Not Working yet - don't use

import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String err;

  ErrorAlert(this.err);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(err),
      content: Text("Did you type correctly?"),
      actions: <Widget>[
        FlatButton(
            child: Text("Oops"), onPressed: () => Navigator.of(context).pop())
      ],
    );
  }
}
