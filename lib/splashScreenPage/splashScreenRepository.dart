import 'package:dartz/dartz.dart';
import 'package:acme_test/commons/failure.dart';

class SplashScreenRepository {
  Future<Either<Failure, bool>> initializeApp() async {
    try {
      ///TODO: In here check if the las session its valid
      return Right(true);
    } on Exception catch (error) {
      return Left(Failure([error.toString()]));
    }
  }
}
