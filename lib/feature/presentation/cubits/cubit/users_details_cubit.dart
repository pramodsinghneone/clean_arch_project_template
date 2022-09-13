import 'package:bloc/bloc.dart';
import 'package:clean_arch_project_template/feature/data/models/user_model.dart';
import 'package:clean_arch_project_template/feature/domain/usecases/get_user_list_use_case.dart';
import 'package:equatable/equatable.dart';

part 'users_details_state.dart';

class UsersDetailsCubit extends Cubit<UsersDetailsState> {
  final GetUserListUseCase getUserListUseCase;
  UsersDetailsCubit({required this.getUserListUseCase})
      : super(UsersDetailsInitial());

  void getUsersList() async {
    emit(UsersDetailsLoading());
    try {
      final response = await getUserListUseCase.call();
      response.fold(
        (error) => emit(UsersDetailsFailure(errorMsg: error.toString())),
        (userModel) => emit(UsersDetailsLoaded(userModel: userModel)),
      );
    } catch (e) {
      emit(UsersDetailsFailure(errorMsg: e.toString()));
    }
  }
}
