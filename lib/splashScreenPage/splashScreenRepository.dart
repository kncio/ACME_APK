import 'package:dartz/dartz.dart';
import 'package:acme_test/commons/failure.dart';

class SplashScreenRepository {
  Future<Either<Failure, bool>> initializeApp() async {
    try {
      //TODO initialice database
      return Right(true);
    } on Exception catch (error) {
      return Left(Failure([error.toString()]));
    }
  }
}
