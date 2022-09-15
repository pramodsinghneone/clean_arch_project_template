import 'dart:convert';

import 'package:clean_arch_project_template/feature/core/base_network.dart';
import 'package:clean_arch_project_template/feature/core/error/exceptions.dart';

import '../../models/user_model.dart';
import 'api_remote_data_source.dart';

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  NetworkService networkService;
  ApiRemoteDataSourceImpl({required this.networkService});
  @override
  Future<UserModel> getUserList() async {
    try {
      final response = await networkService.get('/api/users?page=2');
      if (response is ServerException) {
        print("response error ${response.error}");
        throw ServerException(error: "${response.error}");
      } else {
        return UserModel.fromJson(response);
      }
    } catch (e) {
      print("catch error$e");

      throw ServerException(error: e.toString());
    }
  }

  @override
  Future<dynamic> getUserListDyanmic() async {
    try {
      final response = await networkService.get('api');
      if (response is ServerException) {
        return ServerException(error: response.toString());
      } else {
        return UserModel.fromJson(response);
      }
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
