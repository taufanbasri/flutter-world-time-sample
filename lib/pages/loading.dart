import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    // make the request
    Response response = await get('https://worldtimeapi.org/api/timezone/Asia/Jakarta');
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);

  }

  @override
  void initState() {
    super.initState();

    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
