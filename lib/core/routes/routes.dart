
import 'package:flutter/material.dart';

import '../../features/event_reporting_system/presentation/drawer_pages/about_application.dart';
import '../../features/event_reporting_system/presentation/drawer_pages/emergency_numbers.dart';
import '../../features/event_reporting_system/presentation/pages/category_page.dart';
import '../../features/event_reporting_system/presentation/pages/home_page.dart';
import '../../features/event_reporting_system/presentation/pages/intro_pages.dart';
import '../../features/event_reporting_system/presentation/pages/login_page.dart';
import '../../features/event_reporting_system/presentation/pages/registration_page.dart';
import '../../features/event_reporting_system/presentation/pages/report_page.dart';
import '../services/permission_service.dart';
import 'paths.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings)  {
 
    switch(settings.name) {
      case Path.intro:
      return MaterialPageRoute(builder: (context) => IntroPages());

      case Path.home:
      permissionService.initializeAllPermissions(); 
      return MaterialPageRoute(builder: (context) => HomePage());
      
      case Path.login:
      permissionService.initializeAllPermissions();
      return MaterialPageRoute(builder: (context) => LoginPage());

      case Path.registration:
      return MaterialPageRoute(builder: (context) => RegistrationPage());

      case Path.category:
      return MaterialPageRoute(builder: (context) => CategoryPage());

      case Path.report:
      return MaterialPageRoute(settings: settings, builder: (context) => ReportPage());

      case Path.emergencyNumbers:
      return MaterialPageRoute(settings: settings, builder: (context) => EmergencyNumbersPage());

      case Path.aboutApp:
       return MaterialPageRoute(settings: settings, builder: (context) => AboutApp());
      default:
      return _errorRoute();
    }
  }  

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}