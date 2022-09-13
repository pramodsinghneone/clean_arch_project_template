part of 'users_details_cubit.dart';

abstract class UsersDetailsState extends Equatable {
  const UsersDetailsState();

  @override
  List<Object> get props => [];
}

class UsersDetailsInitial extends UsersDetailsState {
  @override
  List<Object> get props => [];
}

class UsersDetailsLoading extends UsersDetailsState {
  @override
  List<Object> get props => [];
}

class UsersDetailsLoaded extends UsersDetailsState {
  final UserModel userModel;
  UsersDetailsLoaded({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class UsersDetailsFailure extends UsersDetailsState {
  final String errorMsg;
  UsersDetailsFailure({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
