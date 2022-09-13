import 'package:clean_arch_project_template/feature/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class ApiRepository {
  Future<Either<Failure, UserModel>> getUserDataList();
}
