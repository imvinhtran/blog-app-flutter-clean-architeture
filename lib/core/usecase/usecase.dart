import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<Success, Params> {
  Future<Either<Failure, Success>> call(Params params);
}
