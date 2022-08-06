import 'package:dio/dio.dart';
import 'package:explore/modules/model/filter.dart';

class FilterProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://macus.vitecdevelopment.com:4200/api/favourGiverList';

  Future<Filter> fetchList() async {
    try {
      final response = await _dio.get(_url);
      return Filter.fromJson(response.data);
    } catch (error) {
    
      return Filter.fromJson(error);
    }
  }
}
