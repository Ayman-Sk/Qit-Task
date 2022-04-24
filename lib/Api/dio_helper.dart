import 'package:dio/dio.dart';
import 'package:task_for_qit/Api/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> login({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Response response = await dio.post(url, data: data);
    if (response.statusCode != 200) {
      print('RES:$response');
      print('status code is ${response.statusCode}');
      return false;
    } else {
      print('RES:$response');
      print('status code is ${response.statusCode}');
      return response;
    }
  }

  static Future<dynamic> getCategories({required String url}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Response response = await dio.get(url);
    if (response.statusCode != 200) {
      print('RES:$response');
      print('status code is ${response.statusCode}');
      return false;
    } else {
      print('RES:$response');
      print('status code is ${response.statusCode}');
      return response;
    }
  }

  static Future<dynamic> getCategoryProducts({required String url}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    Response response = await dio.get(url);
    if (response.statusCode != 200) {
      print('RES:$response');
      print('status code is ${response.statusCode}');
      return false;
    } else {
      print('RES:$response');
      print('status code is ${response.statusCode}');
      return response;
    }
  }
}
