import 'package:clean_arch_project_template/feature/data/models/user_model.dart';

abstract class ApiRemoteDataSource {
  Future<UserModel> getUserList();
  Future<dynamic> getUserListDyanmic();
}
