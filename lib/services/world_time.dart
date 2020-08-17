import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
    String baseUrl = 'http://worldtimeapi.org/api/timezone/';

    String location;
    String locationUrl;
    String time;
    String flag;

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
            } catch (error) {
                /// Update time is nil
                this.time = '';
            }
        } else {
            print('Request failed with status: ${response.statusCode}.');
        }
    }
}