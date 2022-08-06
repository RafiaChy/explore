import 'dart:convert';
import 'dart:io';
import 'package:explore/config/failure.dart';
import 'package:explore/utils/enums/api_url.dart';
import 'package:explore/utils/enums/fetch_error.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  final String _baseUrl = ApiUrl.baseUrl.value;

  final accessData = '';
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw Failure(
          fetchError: FetchError.badRequest,
        );
      case 401:
        throw Failure(
          fetchError: FetchError.unauthorized,
        );
      case 403:
        throw Failure(
          fetchError: FetchError.forbidden,
        );
      case 404:
        throw Failure(
          fetchError: FetchError.notFound,
        );
      case 405:
        throw Failure(
          fetchError: FetchError.methodNotAllowed,
        );

      case 500:
        throw Failure(
          fetchError: FetchError.internalServerError,
        );

      case 501:
        throw Failure(
          fetchError: FetchError.notImplemented,
        );

      case 502:
        throw Failure(
          fetchError: FetchError.badGateway,
        );

      case 503:
        throw Failure(
          fetchError: FetchError.serviceUnavailable,
        );

      case 504:
        throw Failure(
          fetchError: FetchError.gatewayTimeout,
        );

      case 505:
        throw Failure(
          fetchError: FetchError.httpVersionNotSupported,
        );

      case 511:
        throw Failure(
          fetchError: FetchError.networkAuthenticationRequired,
        );

      default:
        throw Failure(
          fetchError: FetchError.unknownError,
        );
    }
  }

  // post request with token
  Future<Map<String, dynamic>> postRequest(
    ApiUrl url,
    Map<String, dynamic> body,
    String token,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url.value),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      );
      final responseJson = _returnResponse(response) as Map<String, dynamic>;
      return responseJson;
    } on SocketException {
      throw Failure(
        fetchError: FetchError.socketError,
      );
    } on HttpException {
      throw Failure(
        fetchError: FetchError.httpError,
      );
    } on FormatException {
      throw Failure(
        fetchError: FetchError.formatError,
      );
    }
  }

  Future<List<Map<String, dynamic>>> postRequestList(
    ApiUrl url,
    Map<String, dynamic> body,
    String token,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url.value),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      );
      final responseJson =
          _returnResponse(response) as List<Map<String, dynamic>>;
      return responseJson;
    } on SocketException {
      throw Failure(
        fetchError: FetchError.socketError,
      );
    } on HttpException {
      throw Failure(
        fetchError: FetchError.httpError,
      );
    } on FormatException {
      throw Failure(
        fetchError: FetchError.formatError,
      );
    }
  }
}
