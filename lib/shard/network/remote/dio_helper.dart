import 'package:articleaert/components/constent/constent.dart';
import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true
        )
    );
  }
  String category='eg';

 static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,

}) async {
  return await dio.get(
      url,
      queryParameters: query);
  }
}