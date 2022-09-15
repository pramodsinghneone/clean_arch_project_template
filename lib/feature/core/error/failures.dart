import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  String failureType;
  ServerFailure({required this.failureType});
  @override
  List<Object?> get props => [failureType];
}

class NetworkFailure extends Failure {
  String failureType;
  NetworkFailure({required this.failureType});
  @override
  List<Object?> get props => [failureType];
}
