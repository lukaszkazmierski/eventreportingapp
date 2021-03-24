import 'package:flutter/material.dart';

import 'dialog.dart';

class SuccessSendReportDialog implements ModalDialog {
  createDialog(BuildContext context) {
     AlertDialog dialog = AlertDialog(
      title: Center(child: Text('Sukces', style: TextStyle(fontSize: 19))),
      content:
          Text('Zgłoszenie zostało wysłane pomyślnie!', style: TextStyle(fontSize: 16)),
    );
    return dialog;
  }
}