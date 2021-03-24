import 'package:eventreportingsystem/core/services/authentication_service.dart';
import 'package:eventreportingsystem/features/event_reporting_system/presentation/dialogs/not_activated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import '../../../../core/routes/paths.dart';
import '../../../../core/services/permission_service.dart';
import '../dialogs/required_location_permission_dialog.dart';
import '../widgets/drawer.dart';



class _HomePageState extends State<HomePage> {
  final _settingsBox = Hive.box('settings');

  @override
  void initState() {
    super.initState();  
    permissionService.isLocationPermissionGranted().then((isGranted) {
      if (isGranted == null || !isGranted) {
          showDialog<void>(
            barrierDismissible: false,
            context: context, 
          builder: (context) => WillPopScope(child: RequiredLocationPermissionDialog().createDialog(context), onWillPop: () {}));
        }
    }).then((value) {
      if(AuthenticationService().isEmailVerified == false && !AuthenticationService().isAnonymous) {
        showDialog<void>(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return WillPopScope(child: NotActivatedDialog()
                      .createDialog(context), onWillPop: (){});
                }).then((value) => Navigator.pushReplacementNamed(context, Path.login));
        
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strona główna'),
        brightness: Brightness.dark
      ),
      drawer: AppDrawer(),
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Jesteś świadkiem wykroczenia? Nie przechodź obojętnie! Zrób zdjęcie, opisz krótko i wyślij zgłoszenie',
              style: TextStyle(fontSize: 18),
            ),
            Container(height: 50),
            Icon(FontAwesomeIcons.arrowDown, size: (MediaQuery.of(context).size.width * 0.15 + MediaQuery.of(context).size.height * 0.06),
            color: _settingsBox.get('darkMode') == true ? Colors.white.withOpacity(0.87) : null,),
           
             Container(height: 50),
            RaisedButton(
              onPressed: () async {
                bool locationStatus =
                    await permissionService.isLocationPermissionGranted();
                if (locationStatus == false || locationStatus == null) {
                  showDialog<void>(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => RequiredLocationPermissionDialog()
                          .createDialog(context));
                } else {
                  Navigator.pushNamed(context, Path.category);
                }
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05, 
                width: MediaQuery.of(context).size.width * 0.40, 
                child: Center(child: Text('Zgłoś', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),))),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

