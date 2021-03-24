import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_colors.dart';

class MainThemes {
  static final lightTheme = _lightTheme();
  static final lightSystemUiTheme = _lightSystemUiTheme();
  static final darkTheme = _darkTheme();
  static final darkSystemUiTheme = _darkSystemUiTheme();
}


ThemeData _lightTheme() {
  return ThemeData(
        appBarTheme: AppBarTheme(
          color:  const Color(0xFF35464F),
          textTheme: TextTheme(headline6: GoogleFonts.lato(fontSize: 20)),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        accentColor: GlobalColors.black,
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: GoogleFonts.lato(color: GlobalColors.black, fontSize: 20),
          subtitle1: GoogleFonts.lato(color: GlobalColors.black),
          button: GoogleFonts.lato(fontWeight: FontWeight.bold),         
        ),

        iconTheme: IconThemeData(color: GlobalColors.black),

        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFFF8FC0D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.lato(color: GlobalColors.black),
          border: UnderlineInputBorder(borderSide: BorderSide(color: GlobalColors.black)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GlobalColors.black)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GlobalColors.black)),
          errorMaxLines: 2,
          errorStyle: GoogleFonts.lato(color: GlobalColors.inputErrorForLight)
        ),
      );
}

SystemUiOverlayStyle _lightSystemUiTheme() {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0xFF35464F),
    systemNavigationBarIconBrightness: Brightness.light,
  );
}


ThemeData _darkTheme() {
  return ThemeData(     
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          textTheme: TextTheme(headline6: GoogleFonts.lato(fontSize: 20))
        ),
        scaffoldBackgroundColor: GlobalColors.backgroundColorForDark,
        accentColor: Colors.white,
        canvasColor: Colors.grey[900],

        textTheme: TextTheme(
          bodyText2: GoogleFonts.lato(color: GlobalColors.whiteLayer1, fontSize: 20),
          subtitle1: GoogleFonts.lato(color: GlobalColors.whiteLayer2),
          button: GoogleFonts.lato(fontWeight: FontWeight.bold),         
        ),

        iconTheme: IconThemeData(color: GlobalColors.black),

        buttonTheme: ButtonThemeData(
          buttonColor: GlobalColors.buttonFillForDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.lato(color: GlobalColors.whiteLayer1),
          border: UnderlineInputBorder(borderSide: BorderSide(color: GlobalColors.whiteLayer1)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GlobalColors.whiteLayer1)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GlobalColors.whiteLayer1)),
          errorMaxLines: 2,
          errorStyle: GoogleFonts.lato(color: GlobalColors.inputErrorForDark)
        ),   
      );
}

SystemUiOverlayStyle _darkSystemUiTheme() {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[900],
    systemNavigationBarIconBrightness: Brightness.light,
  );
}