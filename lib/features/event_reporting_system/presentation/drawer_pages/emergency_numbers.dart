import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/drawer.dart';

var emergencyNumbersList =[
  Tuple3<IconData, String, String>(FontAwesomeIcons.bell, '112 - numer alarmowy', 'tel://112'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.ship, '984 - Pogotowie Rzeczne', 'tel://984'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.mountain, '985 - Ratownictwo Morskie i Górskie', 'tel://985'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.shieldAlt, '986 - Straż Miejska', 'tel://986'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.square, '987 - woj. zarządzanie kryzysowe', 'tel://987'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.hospital, '989 - Narodowy Fundusz Zdrowia', 'tel://989'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.bolt, '991 - Pogotowie Energetyczne', 'tel://991'),
  Tuple3<IconData, String, String>(Icons.local_gas_station, '992 - Pogotowie Gazowe', 'tel://992'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.faucet, '993 - Pogotowie Ciepłownicze', 'tel://993'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.water, '994 - Pogotowie Wodociągowe', 'tel://994'),
  Tuple3<IconData, String, String>(Icons.local_police, '997 - Policja', 'tel://997'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.fireExtinguisher, '998 - Straż Pożarna', 'tel://998'),
  Tuple3<IconData, String, String>(FontAwesomeIcons.ambulance, '999 - Pogotowie Ratunkowe', 'tel://999')
];

class EmergencyNumbersPage extends StatelessWidget {
  final _settingsBox = Hive.box('settings');

  @override
  Widget build(BuildContext context) {
    var darkMode = _settingsBox.get('darkMode') ?? false;
    return ValueListenableBuilder(
      valueListenable: _settingsBox.listenable(), 
      builder: (context, value, child) {
        return Scaffold(
      appBar: AppBar(
        title: Text('Numery Alarmowe'),
        brightness: Brightness.dark
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: emergencyNumbersList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: darkMode == true ? Colors.white : Colors.black)),         
            ),
            child: ListTile(
            leading: Icon(emergencyNumbersList[index].value1, color: darkMode == true ? Colors.white : Colors.black),
            title: Text(emergencyNumbersList[index].value2),
            trailing: GestureDetector(onTap: () => launch(emergencyNumbersList[index].value3),
            child: Icon(FontAwesomeIcons.phone, color: darkMode == true ? Colors.white : Colors.black)),
          ),
          );
        },
      )
    );
      });
    
  }
}