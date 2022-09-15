import 'package:clean_arch_project_template/feature/core/base_network.dart';
import 'package:clean_arch_project_template/feature/data/data_sources/remote/api_remote_data_source.dart';
import 'package:clean_arch_project_template/feature/data/data_sources/remote/api_remote_data_source_impl.dart';
import 'package:clean_arch_project_template/feature/data/repository/api_repository_impl.dart';
import 'package:clean_arch_project_template/feature/domain/repository/api_repository.dart';
import 'package:clean_arch_project_template/feature/domain/usecases/get_user_list_use_case.dart';
import 'package:clean_arch_project_template/feature/presentation/cubits/cubit/users_details_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Other
  di.registerLazySingleton(() => Logger());

//  Network Service
  di.registerLazySingleton(() => NetworkService());
  // Remote data source
  di.registerLazySingleton<ApiRemoteDataSource>(
      () => ApiRemoteDataSourceImpl(networkService: di.call()));

  // Repository
  di.registerLazySingleton<ApiRepository>(
      () => ApiRepositoryImpl(apiRemoteDataSource: di.call()));

  // Use Cases
  di.registerLazySingleton(() => GetUserListUseCase(apiRepository: di.call()));

  // Cubits
  di.registerFactory(() => UsersDetailsCubit(getUserListUseCase: di.call()));
}
