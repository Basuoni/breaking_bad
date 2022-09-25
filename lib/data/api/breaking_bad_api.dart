import 'package:breaking_bad/shared/components/constants.dart';
import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: 20 * 1000,
    receiveTimeout: 20 * 1000,
  ));

  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
