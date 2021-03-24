import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dialog.dart';

class RequiredLocationPermissionDialog implements ModalDialog {
  createDialog(BuildContext context) {
     AlertDialog dialog = AlertDialog(
      title: Text('Lokalizacja jest wymaganym uprawnieniem'),
      content:
          Text('Do prawidłowego działania aplikacji wymagana jest lokalizacja. Udziel uprawnienia'),
      actions: [
        FlatButton(
          textColor: const Color(0xFF88DDD5),
          onPressed: () => AppSettings.openAppSettings(),
          child: Text('Ustawienia aplikacji'),
        ),
        FlatButton(
          textColor: const Color(0xFF88DDD5),
          onPressed: () => SystemNavigator.pop(),
          child: Text('Wyjście'),
        ),

      ],
    );
    return dialog;
  }
}