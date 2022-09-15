import 'dart:io';

import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import 'network_info.dart';

enum Environment { PRODUCTION, DEVELOPMENT, UAT }

class BaseUrl {
  //
  // static var environment = Environment.DEVELOPMENT;
  static var environment = Environment.UAT;
  // static var environment = Environment.PRODUCTION;

  static String getBaseUrl() {
    switch (environment) {
      case Environment.DEVELOPMENT:
        return "https://amrutanjan.php-dev.in/";
      case Environment.UAT:
        return "https://www.testamrutanjan.com/";
      case Environment.PRODUCTION:
        return "https://www.worldofamrutanjan.com/";

      default:
        return "https://amrutanjan.php-dev.in/";
    }
  }

  static String getBaseUrlImages() => getBaseUrl() + "pub/media/";
}

class NetworkHelper {
  static var apiTimeStamp = Duration(seconds: 60);

  final Dio dio;
  final NetworkInfo networkInfo;
  // final UserDatasource userDatasource;

  NetworkHelper({required this.dio, required this.networkInfo}) {}

  Future<Map<String, String>> getHeader(bool requireToken) async {
    if (requireToken == true) {
      var user;
      var token;
      try {
        // user = await userDatasource
        //     .fetchUserDetails(FetchUserDetailsParam(key: "token"));
        // token = Encryptor().decrypt(str: user ?? Global().authKey);
      } catch (e) {
        throw ServerException(error: "Token Not Found");
      }

      return {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'STR_BEARER' + token
      };
    } else {
      return {
        HttpHeaders.contentTypeHeader: "application/json",
      };
    }
  }

  Future<Response<dynamic>> get(String url,
      {Map? queryParameters, bool? requireToken}) async {
    print(BaseUrl.getBaseUrl() + url);
    // print(queryParameters);
    Response response;
    bool i = true;

    if (await networkInfo.currentNetworkConnection()) {
      try {
        response = await dio.get(BaseUrl.getBaseUrl() + url,
            // queryParameters: queryParameters.isEmpty ? null : queryParameters,
            options: Options(headers: await getHeader(requireToken!)));

        return response;
      } on DioError catch (e) {
        _error(e);
      }
    } else {
      _internetException();
    }
    return Response(requestOptions: RequestOptions(path: ''));
  }

  Future<Response<dynamic>> post(String url, dynamic body,
      {bool? requireToken}) async {
    if (await networkInfo.currentNetworkConnection()) {
      try {
        // lg(await getHeader(requireToken));
        print(BaseUrl.getBaseUrl() + url);
        final response = await dio.post(BaseUrl.getBaseUrl() + url,
            data: body,
            options: Options(headers: await getHeader(requireToken!)));
        if (response.statusCode == 200) {
          return response;
        } else {
          // lg("Invalid");
          throw ServerException(error: response.statusMessage);
        }
      } on DioError catch (e) {
        // lg(e);
        _error(e);
      }
    } else {
      _internetException();
    }
    return Response(requestOptions: RequestOptions(path: ''));
  }

  void _error(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      print("Connection");
      // showToast("Connection Timeout");
      throw ServerException(error: "Connection Timeout");
    } else if (e.type == DioErrorType.receiveTimeout) {
      throw ServerException(error: "Receive Timeout");
    } else {
      // throw ServerException(error: e.response.data["message"]);
    }
  }

  void _internetException() {
    throw InternetException(error: "No Internet");
  }
}
