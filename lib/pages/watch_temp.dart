import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:world_time/services/calc_temp.dart';
import 'package:delayed_display/delayed_display.dart';

class WatchTemp extends StatefulWidget {
  final String title;
  const WatchTemp({Key key,this.title}) : super(key: key);

  @override
  _WatchTempState createState() => _WatchTempState();
}

class _WatchTempState extends State<WatchTemp> {
  @override


  Map df={};



  Widget build(BuildContext context) {

    df = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text('TEMPERATURE'),
      ),
      body : Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height : 40.0),
            Text('CURRENT TEMPERATURE : ',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text('${df['temm']} °C',
            style: TextStyle(
              fontSize: 22.0,
            ),),
            SizedBox(height : 40.0),
            Text('REAL FEEL TEMPERATURE : ',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${df['feel']} °C',
              style: TextStyle(
                fontSize: 22.0,
              ),),
            SizedBox(height : 40.0),
            Text('HUMIDITY : ',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${df['humi']} %',
            style: TextStyle(
              fontSize: 22.0,
            ),),
          ],
        ),
      ),
    );
  }
}
