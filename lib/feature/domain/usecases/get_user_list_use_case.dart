import 'package:clean_arch_project_template/feature/core/error/failures.dart';
import 'package:clean_arch_project_template/feature/data/models/user_model.dart';
import 'package:clean_arch_project_template/feature/domain/repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserListUseCase {
  ApiRepository apiRepository;
  GetUserListUseCase({required this.apiRepository});

  Future<Either<Failure, UserModel>> call() async =>
      await apiRepository.getUserDataList();
}
