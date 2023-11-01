import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../../common/image_resources.dart';

class MainCardWeather extends StatelessWidget {
  const MainCardWeather(
      {super.key, this.temp, this.wind, this.feelsLike, this.city,this.image});

  final double? temp;
  final double? wind;
  final double? feelsLike;
  final String? city;
  final Widget? image;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black45,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'flutterfonts',
                      ),
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Text(
                      "${(temp! - 273.15).round().toString()} \u2103",
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Colors.black45, fontFamily: 'flutterfonts'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Feels Like :${(feelsLike! - 273.15).round().toString()} \u2103',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black38,
                            fontSize: 15,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: image,
                    ),
                    Text(
                      'wind ${wind!} m/s',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
