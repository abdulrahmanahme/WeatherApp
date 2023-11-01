abstract class WeatherStates{}
class InitialState extends WeatherStates{}

class LoadingWeatherState extends WeatherStates{}

class SuccessWeatherState extends WeatherStates{}

class ErrorWeatherState extends WeatherStates{
  String error;
  ErrorWeatherState({required this.error});

}

////////

class LoadingWeatherCountryState extends WeatherStates{}

class SuccessWeatherCountryState extends WeatherStates{}

class ErrorWeatherCountryState extends WeatherStates{
  String error;
  ErrorWeatherCountryState({required this.error});

}