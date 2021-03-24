import 'package:flutter/material.dart';

import 'dialog.dart';

class InternetConnectionFailureDialog implements ModalDialog {
  String contentTxt;

  InternetConnectionFailureDialog(this.contentTxt);

  createDialog(BuildContext context) {
     AlertDialog dialog = AlertDialog(
      title: Text('Błąd połączenia z internetem', style: TextStyle(fontSize: 19)),
      content:
          Text(contentTxt, style: TextStyle(fontSize: 16)),
      actions: [
        FlatButton(
          textColor: const Color(0xFF88DDD5),
          onPressed: () => Navigator.pop(context),
          child: Text('Ok'),
        ),

      ],
    );
    return dialog;
  }
}