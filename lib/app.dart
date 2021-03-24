import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/routes/paths.dart';
import 'core/routes/routes.dart';
import 'core/services/authentication_service.dart';
import 'core/styles/main_themes.dart';

class _AppState extends State<App> {
  final authenticationService = AuthenticationService();
  final _settingsBox = Hive.box('settings');


  @override
  void initState() {
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _settingsBox.listenable(),
      builder: (context, box, widget) {
        ThemeData currentTheme;
        SystemUiOverlayStyle currentSystemUiTheme;
        final darkMode = box.get('darkMode') ?? false;
        if (darkMode == true) {
          currentTheme = MainThemes.darkTheme;
          currentSystemUiTheme = MainThemes.darkSystemUiTheme;
        } else {
          currentTheme = MainThemes.lightTheme;
          currentSystemUiTheme = MainThemes.lightSystemUiTheme;
        }

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: currentSystemUiTheme,
          child: MaterialApp(
              onGenerateRoute: Routes.generateRoute,
              onGenerateInitialRoutes: (initialRoute) {
                if (_settingsBox.get('intro') == true) {
                  return [
                    Routes.generateRoute(RouteSettings(name: Path.intro))
                  ];
                } else {
                  if (authenticationService.isUserSignedIn) {
                    return [
                      Routes.generateRoute(RouteSettings(name: Path.home))
                    ];
                  } else {
                    return [
                      Routes.generateRoute(RouteSettings(name: Path.login))
                    ];
                  }
                }
              },
              theme: currentTheme),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}
