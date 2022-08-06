import 'package:dio/dio.dart';
import 'package:explore/modules/model/filter.dart';

class FilterProvider {
  final Dio _dio = Dio();

  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmU4YTcwNzNiODczYjUyZDU5MWU5M2IiLCJpYXQiOjE2NTk1MjM0MDQsImV4cCI6MTY2MDEyODIwNH0.wt8rAD7MAXWv7whX7OO1qSFe5LEQWsozNfZhVbvbc9Y";

  final String _url =
      'https://macus.vitecdevelopment.com:4200/api/favourGiverList';

  Future<Filter> fetchList() async {
    try {
      _dio.options.headers['Authorization'] = "token  $token";
      final response = await _dio.post(_url, data: null);
      print('Response Printing ${response.data}');
      return Filter.fromJson(response.data);
    } catch (error) {
      return Filter.fromJson(error);
    }
  }
}
