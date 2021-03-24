import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import '../../../../core/routes/paths.dart';



class _IntroPagesState extends State<IntroPages> {
  final _settingsBox = Hive.box('settings');
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Zgłoś zdarzenie",
        description: "Raportowanie do władz problemów to już kwestia kilku kliknięć na Twoim smartfonie!",
        pathImage: 'assets/images/send_report_intro.png',
        backgroundColor: const Color(0xFFbab529),
      ),
    );

    slides.add(
      new Slide(
        title: "Bądź w kontakcie",
        pathImage: 'assets/images/stay_in_touch_intro.png',
        description: """
        Zarejestruj się w naszym serwisie, by zostawić swój adres e-mail. 
        Jeśli zgłoszenie będzie wymagało kontaktu czy współpracy, skontaktujemy się z Tobą!
        """,
        backgroundColor: const Color(0xFF203152),
      ),
    );

    slides.add(
      new Slide(
        title: "Zadbaj o Siebie i otoczenie",
        pathImage: 'assets/images/safe_intro.png',
        description: """
        Nie bądź obojętny na środowisko, 
        które Cię otacza.
        Pomóż lokalnym władzom zadbać o bezpieczeństwo oraz jakość życia w mieście.
        """,
        backgroundColor: const Color(0xFFe32954),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
      renderNextBtn: nextBtn(),
      renderSkipBtn: skipBtn(),
      renderDoneBtn: doneBtn());
  }

   Widget nextBtn() {
    return Icon(
      FontAwesomeIcons.chevronRight,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget doneBtn() {
    return Icon(
      FontAwesomeIcons.checkCircle,
      color: Colors.white,
      size: 35.0,
    );
  }

   Widget skipBtn() {
    return Icon(
      FontAwesomeIcons.fastForward,
      color: Colors.white,
       size: 35.0,
    );
  }


  void onDonePress() {
    _settingsBox.put('intro', false);
    Navigator.pushReplacementNamed(context, Path.login);
  }

  @override
  void dispose() {
    super.dispose();
  }

}

class IntroPages extends StatefulWidget {
  @override
  _IntroPagesState createState() => _IntroPagesState();
}