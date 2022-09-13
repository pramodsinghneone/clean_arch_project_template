import 'package:bloc/bloc.dart';
import 'package:clean_arch_project_template/feature/domain/usecases/get_user_list_use_case.dart';
import 'package:equatable/equatable.dart';

part 'users_details_state.dart';

class UsersDetailsCubit extends Cubit<UsersDetailsState> {
  final GetUserListUseCase getUserListUseCase;
  UsersDetailsCubit({required this.getUserListUseCase})
      : super(UsersDetailsInitial());
}
