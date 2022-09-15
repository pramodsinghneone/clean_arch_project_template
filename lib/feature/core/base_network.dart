import 'dart:convert';

import 'package:clean_arch_project_template/feature/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../di.dart';
import 'base_client.dart';

class NetworkService {
  String baseUrl = '';

  NetworkService() {
    print('NetworkService callllleeeeeddddddd');
    baseUrl = BaseClient.getBaseUrl(ENVIRONMENT.dev);
  }
  var client = http.Client();
  Future<dynamic> get(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      print(url);
      var headersAll = commonHeaders();
      var response = await client.get(url, headers: headersAll);

      var responseComm = await responseCommon(response);
      return responseComm;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  Future<dynamic> post(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var headersAll = commonHeaders();
      var response = await client.post(url, headers: headersAll);
      var responseComm = await responseCommon(response);
      return responseComm;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  Future<dynamic> put(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var headersAll = commonHeaders();
      var response = await client.put(url, headers: headersAll);
      var responseComm = await responseCommon(response);
      return responseComm;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  Future<dynamic> delete(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var headersAll = commonHeaders();
      var response = await client.delete(url, headers: headersAll);
      var responseComm = await responseCommon(response);
      return responseComm;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  Future<dynamic> responseCommon(http.Response response) async {
    di<Logger>().d(response.body);
    switch (response.statusCode) {
      case 200:
        var jsonBody = jsonDecode(response.body);
        return jsonBody;
      case 403:
        return ServerException(
            error: '${response.statusCode} ${response.toString()}');
      case 404:
        return ServerException(
            error: '${response.statusCode} ${response.toString()}');
      case 500:
        return ServerException(
            error: '${response.statusCode} Internal Server Error ');
    }
  }

  Map<String, String>? commonHeaders() {
    Map<String, String> headers = BaseClient.getHeaders();
    // Map<String, String> headersLocal = {
    //   'Authorisation': 'Bearer token',
    //   'api_key': 'apikey',
    // };
    // headers.addAll(headersLocal);
    return headers;
  }
}
