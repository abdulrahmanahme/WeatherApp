import 'package:flutter/material.dart';
import 'package:weather/common/app_const.dart';
import 'package:weather/core/network/weather_remote_data_source.dart';
import 'package:weather/features/view/pages/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  RemoteDataSource.initial();
 await APPConst.getLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const  HomeScreen(),
    );
  }
}

