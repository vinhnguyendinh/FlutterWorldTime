import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
    String baseUrl = 'http://worldtimeapi.org/api/timezone/';

    String location;
    String locationUrl;
    String time;
    String flag;
    bool isDaytime;

    WorldTime({ this.location, this.locationUrl, this.flag });

    Future<void> getTime() async {
        var url = baseUrl + locationUrl;
        var response = await http.get(url);

        if (response.statusCode == 200) {
            try {
                Map jsonResponse = convert.jsonDecode(response.body);
                String dateTimeString = jsonResponse['datetime'];

                /// Convert date string to date time
                DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
                DateTime dateTime = dateFormat.parse(dateTimeString);

                /// Update time
                this.time = DateFormat.jm().format(dateTime);
                this.isDaytime = (dateTime.hour > 6 && dateTime.hour < 20) ? true : false;
            } catch (error) {
                /// Update time is nil
                this.time = '';
                this.isDaytime = false;
            }
        } else {
            print('Request failed with status: ${response.statusCode}.');
        }
    }
}