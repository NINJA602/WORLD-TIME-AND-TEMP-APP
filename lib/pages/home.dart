import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:world_time/services/calc_temp.dart';

int xk;
int xj;
int xz;

class Home extends StatefulWidget {
  final String title;
  const Home({Key key,this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override

  Map data={};


  void TR(String u) async{
    CalcTemp instance = CalcTemp(location:u );
    await instance.getWeather();
    xk = instance.temperature;
    xj = instance.humidity;
    xz = instance.feelslike;
  }


  Widget build(BuildContext context) {

    data=data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    print(data);


    String bgImage=data['isDaytime']?'day2.jpg':'night.jpg';

    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton.icon(onPressed: () async{
                  dynamic result=await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'isDaytime':result['isDaytime'],
                      'flag':result['flag'],

                    };
                  });
                }, icon: Icon(Icons.edit_location,color: Colors.grey[200],), label: Text('EDIT LOCATION',
                style: TextStyle(
                  color: Colors.grey[200],
                ),)),
                SizedBox(height: 50.0),
                Image(image: AssetImage('assets/${data['flag']}'),width:130.0,height:120.0),
                SizedBox(height:30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.0),
                    Text(data['location'],
                      style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                      ) ,),
                  ],
                ),
                SizedBox(height: 40.0),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.grey[200],
                ),),
                SizedBox(height: 50.0),
                FlatButton.icon(onPressed: () async{
                  TR(data['location']);
                  Future.delayed(const Duration(milliseconds: 800) , ()
                  {
                    Navigator.pushNamed(context, '/watch', arguments: {
                      'loc': data['location'],
                      'temm': xk,
                      'humi' : xj,
                      'feel' : xz,
                    });
                  });
                }, icon: Icon(Icons.wb_sunny,color: Colors.grey[200]), label: Text('CHECK THE TEMP',style: TextStyle(color: Colors.grey[200]),))

              ],
            ),
          ),
      ),
    );
  }
}
