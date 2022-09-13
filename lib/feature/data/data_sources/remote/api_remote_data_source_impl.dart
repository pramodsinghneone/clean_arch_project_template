import 'dart:convert';

import 'package:clean_arch_project_template/feature/core/error/exceptions.dart';

import '../../models/user_model.dart';
import 'api_remote_data_source.dart';
import 'package:http/http.dart' as http;

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  @override
  Future<UserModel> getUserList() async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final url = Uri.parse("https://reqres.in/api/users?page=2");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        return UserModel.fromJson(resBody);
      } else {
        throw ServerException("");
      }
    } catch (e) {
      print(e);
      throw ServerException(e.toString());
    }
  }
}
