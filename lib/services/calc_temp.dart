import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';



class CalcTemp
{
  String location;
  int temperature;
  int humidity;
  int feelslike;
  CalcTemp({String location})
  {
    this.location=location;
  }



  Future<void> getWeather() async {
    try {
      Response response = await get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=252e967dd81d45d584760731211507&q='+ location + '&aqi=yes'));
      Map result = jsonDecode(response.body);
      //print(result);
      Map bb = result['current'];
      //print(bb);
      //print(bb['temp_c']);
      temperature = bb['temp_c'].round();
      //print(temperature);
      humidity = bb['humidity'];
      feelslike = bb['feelslike_c'].round();
      //print(humidity);
    }
    catch(e)
    {
      print('SOMETHING WENT WRONG.');
    }
  }

}
