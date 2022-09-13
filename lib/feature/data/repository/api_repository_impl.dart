import 'package:clean_arch_project_template/feature/core/error/exceptions.dart';
import 'package:clean_arch_project_template/feature/data/data_sources/remote/api_remote_data_source.dart';
import 'package:clean_arch_project_template/feature/data/models/user_model.dart';
import 'package:clean_arch_project_template/feature/core/error/failures.dart';
import 'package:clean_arch_project_template/feature/domain/repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiRemoteDataSource apiRemoteDataSource;
  ApiRepositoryImpl({required this.apiRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> getUserDataList() async {
    try {
      final usersList = await apiRemoteDataSource.getUserList();
      return Right(usersList);
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
