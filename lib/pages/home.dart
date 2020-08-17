import 'package:flutter/material.dart';
import 'package:world_time/models/world_time_arguments.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as WorldTimeArguments.
    final WorldTimeArguments worldTimeArguments = ModalRoute.of(context).settings.arguments;
    print(worldTimeArguments.location);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              worldTimeArguments.location,
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Text(
              worldTimeArguments.time,
              style: TextStyle(
                fontSize: 60,
                color: Colors.grey[800]
              ),
            )
          ],
        ),
      ),
    );
  }
}
