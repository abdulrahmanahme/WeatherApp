import 'package:geolocator/geolocator.dart';
import 'package:weather/common/image_resources.dart';

class APPConst{
  static  String key='76ad9f082f6abb51b82db37514a560a7#';
static String ?lat;
 static  String? long;
 static  Future getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    var location = await Geolocator.getCurrentPosition();
    lat = location.latitude.toString();
    long = location.longitude.toString();
    print('My Locations is ${location}');
  }

  
 static String getWeatherAnimation(String? minCoitions) {
    if (minCoitions == null) return ImageResources.cloudyAnim;
    if (minCoitions == "Clouds") {
      minCoitions = ImageResources.cloudy;
    } else if (minCoitions == "rain") {
      minCoitions = ImageResources.rain;
    } else if (minCoitions == "Clear") {
      minCoitions = ImageResources.clear;
    } else {
      minCoitions = ImageResources.cloudyAnim;
    }
    return minCoitions;
  }
}