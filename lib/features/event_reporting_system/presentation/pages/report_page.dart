import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';
import 'package:super_enum/super_enum.dart';

import '../../../../core/routes/paths.dart';
import '../../../../core/styles/global_colors.dart';
import '../bloc/report_bloc/report_bloc.dart';
import '../dialogs/internet_connection_failure.dart';
import '../dialogs/success_send_report.dart';

var darkMode;
bool _descriptionError = false;
//bool _photoError = false;
bool _locationError = false;

class _ReportPageState extends State<ReportPage> {
  String category = null;
  final settingsBox = Hive.box('settings');

  @override
  void initState() {
    super.initState();
    darkMode = settingsBox.get('darkMode') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text('Zgłaszanie'), brightness: Brightness.dark),
        resizeToAvoidBottomInset: false,
        body: BlocProvider<ReportBloc>(
            create: (_) => ReportBloc(),
            child: BlocListener<ReportBloc, ReportState>(
                listener: (context, state) {
                  if (state is PhotoError || state is NetworkError) {
                    context
                        .read<ReportBloc>()
                        .add(ReportEvent.restorePreviouslyState());
                    if (state is NetworkError) {
                       showDialog<void>(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return InternetConnectionFailureDialog('Aby móc wysłać zgłoszenie należy mieć włączony internet. Sprawdź połączenie i kontynuuj, jeśli jesteś połączony z siecią przez WiFi lub Dane komórkowe').createDialog(context);
                      });
                    }
                  } else if (state is Success) {
                    context
                        .read<ReportBloc>()
                        .add(ReportEvent.restorePreviouslyState());

                     showDialog<void>(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        Timer _timer;
                        _timer = Timer(Duration(seconds: 2), () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.pushReplacementNamed(context, Path.home);
                        });
                        return SuccessSendReportDialog().createDialog(context);
                      });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _DescriptionField(),
                        _ActionButtonsSection(),
                        Row(
                          children: <Widget>[
                            _ImageViewer(),
                            _LocationDataViewer(),
                          ],
                        ),
                        ErrorViewerSection(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: _ReportBtn(category, refresh),
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  void refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _DescriptionField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
        buildWhen: (previous, current) =>
            (previous.crimeReport?.description ?? false) !=
            (current.crimeReport?.description ?? false),
        builder: (context, state) {
          return TextField(
            maxLines: 3,
            maxLength: 250,
            decoration: descriptionDecoration(),
            onChanged: (value) => context
                .read<ReportBloc>()
                .add(ReportEvent.descriptionChanged(description: value)),
          );
        });
  }

  InputDecoration descriptionDecoration() {
    if (darkMode == true) {
      return InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalColors.whiteLayer1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalColors.whiteLayer1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalColors.whiteLayer1)),
          labelText: "Opis zdarzenia",
          labelStyle: TextStyle(color: GlobalColors.whiteLayer2),
          counterStyle: TextStyle(color: GlobalColors.whiteLayer2),
          errorText: _descriptionError ? 'Opis jest wymagany' : null);
    } else {
      return InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelText: "Opis zdarzenia",
          labelStyle: TextStyle(color: Colors.black),
          counterStyle: TextStyle(color: Colors.black),
          errorText: _descriptionError ? 'Opis jest wymagany' : null);
    }
  }
}

class _PickImageBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return RawMaterialButton(
          onPressed: () =>
              context.read<ReportBloc>().add(ReportEvent.pickImage()),
          padding: EdgeInsets.all(15.0),
          fillColor: darkMode == true
              ? GlobalColors.buttonFillForDark
              : GlobalColors.buttonFillForLight,
          elevation: 2.0,
          shape: CircleBorder(),
          child: Icon(FontAwesomeIcons.image),
        );
      },
    );
  }
}

class _PickCameraBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return RawMaterialButton(
          onPressed: () =>
              context.read<ReportBloc>().add(ReportEvent.pickCamera()),
          padding: EdgeInsets.all(15.0),
          fillColor: darkMode == true
              ? GlobalColors.buttonFillForDark
              : GlobalColors.buttonFillForLight,
          elevation: 2.0,
          shape: CircleBorder(),
          child: Icon(FontAwesomeIcons.camera),
        );
      },
    );
  }
}

class _LocationBtnState extends State<_LocationBtn> {
  @override
  void initState() {
    super.initState();
    context.read<ReportBloc>().add(ReportEvent.getPosition());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return RawMaterialButton(
          onPressed: () =>
              context.read<ReportBloc>().add(ReportEvent.getPosition()),
          padding: EdgeInsets.all(15.0),
          fillColor: darkMode == true
              ? GlobalColors.buttonFillForDark
              : GlobalColors.buttonFillForLight,
          elevation: 2.0,
          shape: CircleBorder(),
          child: Icon(FontAwesomeIcons.mapMarkerAlt),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _LocationBtn extends StatefulWidget {
  @override
  _LocationBtnState createState() => _LocationBtnState();
}

class _ActionButtonsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.04,
        ),
        child: Row(
          children: [
            _PickImageBtn(),
            _PickCameraBtn(),
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
            ),
            _LocationBtn(),
          ],
        ));
  }
}

class _ImageViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      buildWhen: (previous, current) =>
          (previous.crimeReport?.photoRef ?? false) !=
          (current.crimeReport?.photoRef ?? false),
      builder: (context, state) {
        var isPhotoPathEmpty = state.crimeReport.photoRef == '' ? true : false;

        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.38,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            alignment: Alignment.center,
            child: Row(children: [
              if (isPhotoPathEmpty)
                Icon(FontAwesomeIcons.paperclip,
                    color: darkMode == true
                        ? GlobalColors.whiteLayer2
                        : Colors.black),
              if (isPhotoPathEmpty)
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              if (isPhotoPathEmpty)
                Expanded(
                    child: Text('Dodaj zdjęcie odpowiadające zgłoszeniu',
                        style: TextStyle(fontSize: 16)))
            ]),
            decoration: isPhotoPathEmpty
                ? null
                : BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(state.crimeReport.photoRef)),
                        fit: BoxFit.fill)),
            color: isPhotoPathEmpty
                ? darkMode == true
                    ? Colors.grey[800]
                    : Colors.grey[100]
                : null,
          ),
        );
      },
    );
  }
}

class _LocationDataViewer extends StatelessWidget {
  final settingsBox = Hive.box('settings');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      buildWhen: (previous, current) =>
          (previous.crimeReport?.position ?? false) !=
          (current.crimeReport?.position ?? false),
      builder: (context, state) {
        return FutureBuilder(
          future: context
              .watch<ReportBloc>()
              .getLocationData(state.crimeReport.position),
          builder:
              (BuildContext context, AsyncSnapshot<List<Placemark>> snapshot) {
            if (snapshot.hasData) {
              final locationData = snapshot.data;
              final spaceBetweenText =
                  MediaQuery.of(context).size.height * 0.015;
              return Flexible(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: darkMode == true
                                  ? GlobalColors.whiteLayer1
                                  : Colors.black)),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06),
                      padding: EdgeInsets.all(2),
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textData("Aktualna lokalizacja:"),
                          Container(
                              height: spaceBetweenText +
                                  MediaQuery.of(context).size.height * 0.004),
                          _textData("Kraj: ${locationData[0].country}"),
                          Container(height: spaceBetweenText),
                          _textData("Miasto: ${locationData[0].locality}"),
                          Container(height: spaceBetweenText),
                          _textData(
                              "Kod pocztowy: ${locationData[0].postalCode}"),
                          Container(height: spaceBetweenText),
                          _textData("Ulica: ${locationData[0].street}"),
                        ],
                      )));
            } else if (snapshot.hasError) {
              return Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: darkMode == true
                            ? GlobalColors.whiteLayer1
                            : Colors.black)),
                width: MediaQuery.of(context).size.width * 0.38,
                child: Text(
                  "Załaduj lokalizację klikając w przycisk!",
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              return Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  Widget _textData(String data) {
    if (data == "Aktualna lokalizacja:") {
      return Text(data,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: darkMode == true
                  ? Colors.white.withOpacity(0.8)
                  : Colors.black));
    } else {
      return RichText(
        text: TextSpan(
          text: data.substring(0, data.indexOf(':') + 1),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: darkMode == true
                  ? Colors.white.withOpacity(0.8)
                  : Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: data.substring(data.indexOf(':') + 1),
                style: TextStyle(
                    fontSize: 11.7,
                    color: darkMode == true
                        ? Colors.white.withOpacity(0.60)
                        : Colors.black.withOpacity(0.7))),
          ],
        ),
      );
    }
  }
}

class ErrorViewerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        child: Row(children: [
          Container(width: MediaQuery.of(context).size.width * 0.15),
          Container(width: MediaQuery.of(context).size.width * 0.09),
          Expanded(
              child: _locationError
                  ? (Text('Lokalizacja jest wymagana',
                      style: TextStyle(
                          color: darkMode == true
                              ? GlobalColors.inputErrorForDark
                              : GlobalColors.inputErrorForLight,
                          fontSize: 14)))
                  : Text('')),
        ]));
  }
}

class _ReportBtn extends StatelessWidget {
  final Function() refreshParent;
  String category;

  _ReportBtn(this.category, this.refreshParent);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                if (category != null)
                  context
                      .read<ReportBloc>()
                      .add(ReportEvent.categoryChanged(category: category));
                if (state.crimeReport.description.isEmpty) {
                  _descriptionError = true;
                } else {
                  _descriptionError = false;
                }
                if (state.crimeReport.position.latitude == 0 &&
                    state.crimeReport.position.longitude == 0) {
                  _locationError = true;
                } else {
                  _locationError = false;
                }
                refreshParent();

                if (!_descriptionError && !_locationError)
                  context.read<ReportBloc>().add(ReportEvent.reportSent());
              },
              child: Text('Zgłoś'),
            ));
      },
    );
  }
}
