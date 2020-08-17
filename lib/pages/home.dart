import 'package:flutter/material.dart';
import 'package:world_time/models/world_time_arguments.dart';
import 'package:world_time/pages/choose_location.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  WorldTimeArguments worldTimeArguments;

  @override
  Widget build(BuildContext context) {
    /// Extract the arguments from the current ModalRoute settings and cast
    /// them as WorldTimeArguments.
    worldTimeArguments = worldTimeArguments == null ? ModalRoute.of(context).settings.arguments : worldTimeArguments;

    /// Background image
    String backgroundImage = worldTimeArguments.isDaytime ? 'day.png' : 'night.png';

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$backgroundImage'),
              fit:  BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Column(
            children: [
              FlatButton(
                onPressed: () async {
                  /// Important: Type of result is 'dynamic'
                  dynamic resultArgs = await Navigator.pushNamed(context, ChooseLocation.routeName);

                  /// Update state to reload layout
                  if (resultArgs != null) {
                    this.setState(() {
                      this.worldTimeArguments = resultArgs;
                    });
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      'Choose location',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 100),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      worldTimeArguments.location,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      worldTimeArguments.time,
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
