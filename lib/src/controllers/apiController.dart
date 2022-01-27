import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/src/configs/appConfig.dart';

class ApiController extends GetxController {
  final _dio = Dio();

  getMovieList() async {
    try {
      final res = await _dio.get(baseUrl);


      //api working

      print(res.data);
    } catch (e) {
      print(e);
    }
  }
}
