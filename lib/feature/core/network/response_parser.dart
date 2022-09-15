import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';
import 'network_helper.dart';

enum HttpMethodType { GET, POST, DELETE }

class ResponseParser {
  NetworkHelper helper;

  ResponseParser({required this.helper});

  Future<Either<Failure, Response>> parseResponse(
      HttpMethodType methodType, String urlEndpoint, dynamic body,
      {bool? requireToken}) async {
    switch (methodType) {
      case HttpMethodType.GET:
        try {
          Response data = await helper.get(urlEndpoint,
              queryParameters: body, requireToken: requireToken);
          return Right(data);
        } catch (e) {
          if (e is ServerException) {
            return Left(ServerFailure(failureType: e.error!));
          }
          if (e is InternetException) {
            return Left(NetworkFailure(failureType: "No Internet"));
          }
        }
        break;
      case HttpMethodType.POST:
        try {
          final data =
              await helper.post(urlEndpoint, body, requireToken: requireToken!);
          return Right(data);
        } catch (e) {
          if (e is ServerException) {
            return Left(ServerFailure(failureType: e.error!));
          }
          if (e is InternetException) {
            return Left(NetworkFailure(failureType: "No Internet"));
          }
        }
        break;
      case HttpMethodType.DELETE:
        // return null;
        break;
    }
    return Left(ServerFailure(failureType: 'No Methohd found'));
  }
}
