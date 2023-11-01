import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/features/viewmodel/cubit/states.dart';
import 'package:weather/features/view/widgets/daily_card_weather.dart';
import 'package:weather/features/view/widgets/hourly_card_weather.dart';
import '../../../../common/app_const.dart';
import '../../viewmodel/cubit/cubit.dart';
import '../widgets/main_card_weather.dart';
import '../widgets/text_fleid.dart';
import '../widgets/title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? lat;
  String? long;

  @override
  void initState() {
    super.initState();
  }

  bool isSearching = false;

  void _handleSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      isSearching = false;
    });
  }

  var countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>WeatherCubit()..getWeather(),
      child: SafeArea(
        child: BlocConsumer<WeatherCubit, WeatherStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey,
                    centerTitle: true,
                    actions: [
                      IconButton(
                        icon: isSearching
                            ? Icon(
                                Icons.close,
                                color: Colors.grey.shade100,
                              )
                            : Icon(Icons.search, color: Colors.grey.shade100),
                        onPressed:
                            isSearching ? _handleSearchEnd : _handleSearch,
                      ),
                    ],
                    title: isSearching
                        ? TextFelid(
                            controller: countryController,
                            onSubmitted: (value) {
                              context.read<WeatherCubit>().getWeatherCountry(country:countryController.text);
                            })
                        :TitleWidget(title: 'Weather App',color: Colors.grey.shade100,)
                      
                  ),
                  body: state is LoadingWeatherState
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: [
                            if (state is SuccessWeatherCountryState)
                              MainCardWeather(
                                temp: context
                                    .read<WeatherCubit>()
                                    .weatherCountry!
                                    .main
                                    .temp,
                                wind: context
                                    .read<WeatherCubit>()
                                    .weatherCountry!
                                    .wind
                                    .speed,
                                feelsLike: context
                                    .read<WeatherCubit>()
                                    .weatherCountry!
                                    .main
                                    .feelsLike,
                                city: context
                                    .read<WeatherCubit>()
                                    .weatherCountry!
                                    .name,
                                image: LottieBuilder.asset(
                                    APPConst.getWeatherAnimation(context
                                        .read<WeatherCubit>()
                                        .weatherCountry!
                                        .weather[0]
                                        .main)),
                              ),
                            if (state is SuccessWeatherState)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainCardWeather(
                                    temp: context
                                        .read<WeatherCubit>()
                                        .weatherModel!
                                        .current
                                        .temp,
                                    wind: context
                                        .read<WeatherCubit>()
                                        .weatherModel!
                                        .current
                                        .windSpeed,
                                    feelsLike: context
                                        .read<WeatherCubit>()
                                        .weatherModel!
                                        .current
                                        .feelsLike,
                                    city: context
                                        .read<WeatherCubit>()
                                        .weatherModel!
                                        .timezone,
                                    image: LottieBuilder.asset(
                                        APPConst.getWeatherAnimation(context
                                            .read<WeatherCubit>()
                                            .weatherModel!
                                            .current
                                            .weather[0].main
                                            )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const TitleWidget(
                                    title: 'Hourly',
                                  ),
                                  SizedBox(
                                    height: 90,
                                    width: double.infinity,
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(
                                        width: 10,
                                      ),
                                      itemCount: context
                                          .read<WeatherCubit>()
                                          .weatherModel!
                                          .hourly
                                          .length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return HourlyCardWeather(
                                          temp: context
                                              .read<WeatherCubit>()
                                              .weatherModel!
                                              .hourly[index]
                                              .temp,
                                          time: context
                                              .read<WeatherCubit>()
                                              .weatherModel!
                                              .hourly[index]
                                              .dt,
                                          image: LottieBuilder.asset(
                                              APPConst.getWeatherAnimation(
                                                  context
                                                      .read<WeatherCubit>()
                                                      .weatherModel!
                                                      .hourly[index]
                                                      .weather[0]
                                                      .main)),
                                        );
                                      },
                                    ),
                                  ),
                                  const TitleWidget(
                                    title: 'Daily',
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // isLoading
                                  SizedBox(
                                    width: double.infinity,
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(
                                        height: 10,
                                      ),
                                      itemCount: context
                                          .read<WeatherCubit>()
                                          .weatherModel!
                                          .daily
                                          .length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return DailyCardWeather(
                                          weatherType: context
                                              .read<WeatherCubit>()
                                              .weatherModel!
                                              .daily[index]
                                              .weather[0]
                                              .main,
                                          min: context
                                              .read<WeatherCubit>()
                                              .weatherModel!
                                              .daily[index]
                                              .temp
                                              .min,
                                          max: context
                                              .read<WeatherCubit>()
                                              .weatherModel!
                                              .daily[index]
                                              .temp
                                              .max,
                                          image: LottieBuilder.asset(
                                              APPConst.getWeatherAnimation(
                                                  context
                                                      .read<WeatherCubit>()
                                                      .weatherModel!
                                                      .daily[index]
                                                      .weather[0]
                                                      .main)),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ));
            }),
      ),
    );
  }
}
