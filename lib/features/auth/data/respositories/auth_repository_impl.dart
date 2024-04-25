import 'package:blog_clean_architecture/core/error/exceptitons.dart';
import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources remoteDataSources;
  const AuthRepositoryImpl(this.remoteDataSources);
  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await remoteDataSources.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(userId);
    } on ServerExceptiton catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logInWithEmailPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }
}
