import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HourlyCardWeather extends StatelessWidget {
  HourlyCardWeather({super.key, this.temp, this.time,this.image});
  final int? time;
  final double? temp;
  int unixTimestamp = 1635700000;
  Widget? image;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // Text(
          //   '${(time!)}',
          //   style: const TextStyle(color: Colors.black, fontSize: 10.0),
          // ),
          SizedBox(
            width: 30,
            height: 30,
            child:image!,
          ),
          Text(
            '${(temp! - 273.15).round().toString()} \u2103',
            style: const TextStyle(color: Colors.black, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
