

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

final _description = '''Zgłaszanie zdarzeń to darmowa i intuicyjna aplikacja pozwalające na proste oraz wygodne zgłaszanie spraw niewymagających natychmiastowej interwencji czy kontaktu z dyspozytorem. Sprawy mogą obejmować niedziałające lub uszkodzone sygnalizacje drogowe, uszkodzone publiczne mienie czy nieprawidłowe lub zniszczone oznakowanie. Zgłoszenie zostaje wysłane do lokalnych władz i w oparciu o przekazane dane zostanie ono przejęte oraz rozwiązane w jak najlepszy możliwy sposób.
      ''';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O aplikacji'),
        brightness: Brightness.dark
      ),
      drawer: AppDrawer(),
      body: Row(children: [
         Flexible(
    child: Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
      child: Text(
        _description,
        style: TextStyle(fontSize: 18),
        textWidthBasis: TextWidthBasis.longestLine,
        softWrap: true
      ),
    )
  ),
      ],)
     
    );
  }
}