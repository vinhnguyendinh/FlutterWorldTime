import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/models/world_time_arguments.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    this.setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Japan', locationUrl: 'Asia/Tokyo', flag: 'japan.png');
    await worldTime.getTime();
    Navigator.pushNamed(
      context,
      Home.routeName,
      arguments: WorldTimeArguments(time: worldTime.time, flag: worldTime.flag, location: worldTime.location),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 150.0,
        ),
      ),
    );
  }
}
