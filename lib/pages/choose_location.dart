import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  final String title;
  const ChooseLocation({Key key,this.title}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(location: 'Auckland', flag: 'new_zealand.png', url: 'Pacific/Auckland'),
    WorldTime(location: 'Dhaka', flag: 'bangladesh.png', url: 'Asia/Dhaka'),
    WorldTime(location: 'Dubai', flag: 'uae.png', url: 'Asia/Dubai'),
    WorldTime(location: 'Johannesburg', flag: 'south_africa.png', url: 'Africa/Johannesburg'),
    WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'London', flag: 'eng.png', url: 'Europe/London'),
    WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),


  ];

  void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context , {
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDaytime':instance.isDaytime,
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('CHOOSE LOCATION'),
          centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        }
        ),
        );
  }
}

