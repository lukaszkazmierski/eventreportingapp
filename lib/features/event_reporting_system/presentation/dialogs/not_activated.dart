import 'package:flutter/material.dart';

import 'dialog.dart';

class NotActivatedDialog implements ModalDialog {
  createDialog(BuildContext context) {
     AlertDialog dialog = AlertDialog(
      title: Text('Konto nie jest aktywowane', style: TextStyle(fontSize: 19)),
      content:
          Text('Aktywuj konto przy użyciu dostarczonego linka aktywnego na podany adres e-mail', style: TextStyle(fontSize: 16)),
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