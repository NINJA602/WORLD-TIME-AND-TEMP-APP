import 'dart:io';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  final String title;
  const Loading({Key key,this.title}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {
  //String time = 'loading';

  void setupWorldTime() async
  {

    WorldTime instance = WorldTime(url: 'Asia/Kolkata', flag: 'india.png', location: 'Kolkata');
      await instance.getTime();

      Navigator.pushReplacementNamed(context,'/home',arguments: {
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDaytime':instance.isDaytime,

      });

  }

  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.green,
      body: Center(
        child:SpinKitWave(
        color: Colors.white,
        size: 50.0,
      ),
    ),
    );
  }
}
