import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_enum/super_enum.dart';

import 'app.dart';
import 'core/settings/settings.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseApp app = await Firebase.initializeApp();
  FirebaseAuth.instanceFor(app: app);
  
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(SettingsAdapter());

  final _settingsBox = await Hive.openBox('settings');
  if (_settingsBox.get('darkMode') == null) {
      _settingsBox.put('darkMode', false);
  }
  if (_settingsBox.get('intro') == null) {
      _settingsBox.put('intro', true);
  }
  if (_settingsBox.get('viewMode') == null) {
      _settingsBox.put('viewMode', 'tiles');
  }

  runApp(App());
  
}
