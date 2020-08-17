import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    home: Loading(),
    routes: {
      Loading.routeName: (context) => Loading(),
      Home.routeName: (context) => Home(),
      ChooseLocation.routeName: (context) => ChooseLocation(),
    },
  ));
}


