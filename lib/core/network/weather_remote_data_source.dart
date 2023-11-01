import 'package:dio/dio.dart';

class RemoteDataSource {
  static late Dio dio;

static  void initial() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.openweathermap.org/data/2.5',
          receiveDataWhenStatusError: true,
          ),
    );
  }

    static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }

}
