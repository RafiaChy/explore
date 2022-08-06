import 'package:explore/config/api_call.dart';
import 'package:explore/modules/model/filter.dart';

import 'package:explore/utils/enums/api_url.dart';

class ApiProvider {
  Future<Map<String, dynamic>> fetchPost(Filter request, String token) async {
    final response = await ApiCall().postRequest(
      ApiUrl.favourGiverList,
      request.toJson(),
      token,
    );
    return response;
  }
}
