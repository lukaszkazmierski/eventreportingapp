
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/routes/paths.dart';
import '../../../../core/services/authentication_service.dart';
import '../../../../core/styles/global_colors.dart';

final _settingsBox = Hive.box('settings');

class AppDrawer extends StatelessWidget {
  AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
    Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (_authenticationService.isUserSignedIn &&
              _authenticationService.isAnonymous && _authenticationService.getUserEmail != null)
          if (_authenticationService.getUserEmail.isEmpty)
            Container(
              height: 120,
              child: DrawerHeader(
                child: Text('Anonimowy', style: _textStyle()),
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: _settingsBox.get('darkMode') == true ? GlobalColors.whiteLayer1 : Colors.black))),
            ),
          if (_authenticationService.isUserSignedIn &&
              _authenticationService.getUserEmail != null)
              if (_authenticationService.getUserEmail.isNotEmpty)
            Container(
              height: 120,
              child: DrawerHeader(
                child: Text('${_authenticationService.getUserEmail}',
                    style: _textStyle()),
              ),
            ),
          ListTile(
              onTap: () => Navigator.pushReplacementNamed(context, Path.home),
              leading: Icon(FontAwesomeIcons.home, color: _iconColor()),
              title: Text('Strona główna', style: _textStyle())),
          
          if (_authenticationService.isUserSignedIn &&
              _authenticationService.getUserEmail != null)
              if (_authenticationService.getUserEmail.isEmpty)
            ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Path.login),
                leading: Icon(FontAwesomeIcons.signInAlt, color: _iconColor()),
                title: Text('Zaloguj/Zarejestruj się', style: _textStyle())),
          _divider(),
          ListTile(
              onTap: () => Navigator.pushNamed(
                  context, Path.emergencyNumbers),
              leading: Icon(FontAwesomeIcons.phoneAlt, color: _iconColor()),
              title: Text('Numery Alarmowe', style: _textStyle())),
          SwitchThemeTile(),
          ListTile(
              onTap: () =>
                  Navigator.pushNamed(context, Path.aboutApp),
              leading: Icon(FontAwesomeIcons.questionCircle, color: _iconColor()),
              title: Text('O aplikacji', style: _textStyle())),
          
        ],
      ),
    ),
    if (_authenticationService.isUserSignedIn && _authenticationService.getUserEmail != null)
    if (_authenticationService.getUserEmail.isNotEmpty)
    Container(
      child: Align(
            alignment: Alignment.bottomCenter,
            child: 
              RaisedButton(onPressed: () { Navigator.pushReplacementNamed(context, Path.login); _authenticationService.signOut(); }, child: Text('Wyloguj')),
          )
    ,)
  ]));
  }
}

Divider _divider() {
  return Divider(color: _settingsBox.get('darkMode') == true ? GlobalColors.whiteLayer1 : Colors.black );
}

TextStyle _textStyle() {
  return GoogleFonts.lato(color: _settingsBox.get('darkMode') == true ? GlobalColors.whiteLayer1 : Colors.black);
}

Color _iconColor() {
  return _settingsBox.get('darkMode') == true ? GlobalColors.whiteLayer1 : Colors.black;
}



class SwitchThemeTile extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _settingsBox.listenable(),
      builder: (context, box, widget) {
       
        return SwitchListTile(
          value: _settingsBox.get('darkMode') ?? false,
          onChanged: (value) async {            
            box.put('darkMode', value);
          },    
          secondary: Icon(FontAwesomeIcons.adjust, color: _iconColor()),
          title: Text('Ciemny Motyw', style: _textStyle()));
      },
    );
  }
  
}
