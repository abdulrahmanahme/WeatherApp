import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import '../../../common/image_resources.dart';

class DailyCardWeather extends StatelessWidget {
  const DailyCardWeather({super.key, this.weatherType, this.min, this.max,this.image});
  final String? weatherType;

  final double? min;
  final double? max;
  final Widget? image;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherType!,
            style: TextStyle(color: Colors.black45, fontSize: 15.0),
          ),
          SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: image!,
          ),
          Text(
            '${(min! - 273.15).round().toString()} /',
            style: TextStyle(color: Colors.black45, fontSize: 20.0),
          ),
          Text(
            '${(max! - 273.15).round().toString()} \u2103',
            style: TextStyle(color: Colors.black45, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
