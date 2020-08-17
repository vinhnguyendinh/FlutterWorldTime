import 'package:flutter/material.dart';
import 'package:world_time/models/world_time_arguments.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  static const routeName = '/location';

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final List<WorldTime> worldTimes  = [
    WorldTime(locationUrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(locationUrl: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(locationUrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(locationUrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(locationUrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(locationUrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(locationUrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(locationUrl: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(worldTime) async {
    await worldTime.getTime();
    Navigator.pop(context, WorldTimeArguments(
        time: worldTime.time,
        flag: worldTime.flag,
        location: worldTime.location,
        isDaytime: worldTime.isDaytime
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a location',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[600],
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          itemCount: this.worldTimes.length,
          itemBuilder: (BuildContext context, int index) {
            /// World time model at index
            WorldTime worldTime = this.worldTimes[index];

            /// Card view
            return Card(
              child: ListTile(
                onTap: () {
                  this.updateTime(worldTime);
                },
                title: Text(worldTime.location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${worldTime.flag}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
