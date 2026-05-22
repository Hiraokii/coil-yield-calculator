import 'package:coil_yield_calculator/core/shared/failures/failure.dart';
import 'package:dartz/dartz.dart';

typedef ReturnFuture<T> = Future<Either<Failure, T>>;

abstract class Usecase<Params, ReturnType> {
  ReturnFuture<ReturnType> call(Params params);
}
