import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import '../../../../core/routes/paths.dart';
import '../../../../core/styles/global_colors.dart';

class Crime {
  var categories;
  Crime(bool _darkMode) {
    final blueBtn = _darkMode == true ? Colors.blue[300] : Colors.blue[700];
    final greenBtn = _darkMode == true ? Colors.green[200] : Colors.green[800];
    final blueGreyBtn =
        _darkMode == true ? Colors.blueGrey[300] : Colors.blueGrey[500];
    final lightGreenBtn =
        _darkMode == true ? Colors.lightGreen[200] : Colors.lightGreen[600];
    categories = [
      Tuple3<String, IconData, Color>(
          'Nękanie', FontAwesomeIcons.userFriends, greenBtn),
      Tuple3<String, IconData, Color>(
          'Rozbój', FontAwesomeIcons.fistRaised, blueBtn),
      Tuple3<String, IconData, Color>(
          'Podpalenie', FontAwesomeIcons.burn, blueGreyBtn),
      Tuple3<String, IconData, Color>(
          'Podżeganie do nienawiści', FontAwesomeIcons.mehBlank, blueGreyBtn),
      Tuple3<String, IconData, Color>(
          'Fałszerstwo', FontAwesomeIcons.passport, greenBtn),
      Tuple3<String, IconData, Color>(
          'Śmieci', FontAwesomeIcons.trash, lightGreenBtn),
      Tuple3<String, IconData, Color>(
          'Zakłócanie spokoju', FontAwesomeIcons.bullhorn, blueBtn),
      Tuple3<String, IconData, Color>(
          'Znaki drogowe', FontAwesomeIcons.directions, lightGreenBtn),
      Tuple3<String, IconData, Color>(
          'Światła', FontAwesomeIcons.lightbulb, greenBtn),
      Tuple3<String, IconData, Color>('Źle zaparkowany pojazd',
          FontAwesomeIcons.parking, greenBtn),
      Tuple3<String, IconData, Color>(
          'Graffiti', FontAwesomeIcons.sprayCan, blueBtn),
      Tuple3<String, IconData, Color>(
          'Uszkodzone mienie', FontAwesomeIcons.houseDamage, blueGreyBtn),
      Tuple3<String, IconData, Color>('Problem z sygnalizacją',
          FontAwesomeIcons.trafficLight, lightGreenBtn),
      Tuple3<String, IconData, Color>(
          'Jezdnia', FontAwesomeIcons.road, greenBtn),
      Tuple3<String, IconData, Color>(
          'Inne', FontAwesomeIcons.question, blueBtn),
    ];
  }
}

final categoriesPerRow = 3;

class ViewMode {
  static final tilesView = 'tiles';
  static final listView = 'list';
}

class CategoryPage extends StatelessWidget {
  final _settingsBox = Hive.box('settings');
  ValueNotifier<String> _viewMode = ValueNotifier(Hive.box('settings').get('viewMode') ?? ViewMode.tilesView);
  Crime _crime;

  @override
  Widget build(BuildContext context) {
    _crime = Crime(_settingsBox.get('darkMode') ?? false);
    return ValueListenableBuilder(
      valueListenable: _viewMode,
      builder: (context, value, child) {
        if (value == ViewMode.tilesView) {
          return Scaffold(
              appBar:
                  AppBar(
                    title: Text('Kategorie'), 
                    brightness: Brightness.dark,
                    actions: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.list),
                        tooltip: 'Widok listy',
                        onPressed: () {
                          _settingsBox.put('viewMode', ViewMode.listView);
                          _viewMode.value = ViewMode.listView;
                        },
                      )
                    ],),
              resizeToAvoidBottomInset: false,
              body: Container(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ListView(
                    children: <Widget>[
                      for (var i = 0;
                          i < _crime.categories.length;
                          i += categoriesPerRow)
                        _createRow(context, i)
                    ],
                  ),
                ),
              ));
        } else if (value == ViewMode.listView) {
          return Scaffold(
              appBar:
                  AppBar(
                    title: Text('Kategorie'), 
                    brightness: Brightness.dark,
                    actions: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.th),
                        tooltip: 'Widok kafelek',
                        onPressed: () {
                          _settingsBox.put('viewMode', ViewMode.tilesView);
                          _viewMode.value = ViewMode.tilesView;
                        },
                      )
                    ],),
              resizeToAvoidBottomInset: false,
              body: Container(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                    widthFactor: 1,
                    child: ListView.builder(
                      itemCount: _crime.categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: (_settingsBox.get('darkMode') ??
                                                  false) ==
                                              true
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, Path.report,
                                  arguments: _crime.categories[index].value1),
                              child: ListTile(
                                leading: Icon(_crime.categories[index].value2, color: (_settingsBox.get('darkMode') ??
                                                  false) ==
                                              true
                                          ? GlobalColors.whiteLayer1
                                          : Colors.black,),
                                title: Text(_crime.categories[index].value1, style: TextStyle(color: (_settingsBox.get('darkMode') ??
                                                  false) ==
                                              true
                                          ? GlobalColors.whiteLayer2
                                          : Colors.black),),
                              ),
                            ));
                      },
                    )),
              ));
        }
      },
    );
  }

  Container _createRow(BuildContext context, int i) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _createOneCategory(context, i),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          if (i + 1 < _crime.categories.length)
            Expanded(
              child: _createOneCategory(context, i + 1),
            ),
          if (i + 1 < _crime.categories.length)
            Container(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          if (i + 2 < _crime.categories.length)
            Expanded(
              child: _createOneCategory(context, i + 2),
            ),
        ],
      ),
    );
  }

  Column _createOneCategory(BuildContext context, int i) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            buttonColor: _crime.categories[i].value3,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Path.report,
                    arguments: _crime.categories[i].value1);
              },
              child: Icon(
                _crime.categories[i].value2,
                size: MediaQuery.of(context).size.width * 0.05 +
                    MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            _crime.categories[i].value1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ]);
  }
}
