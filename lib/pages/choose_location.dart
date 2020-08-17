import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  static const routeName = '/location';

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Text('Choose location');
  }
}
