import 'package:acme_test/commons/failure.dart';
import 'package:acme_test/loginPage/loginDataModel.dart';
import 'package:dartz/dartz.dart';

class LoginPageRepository {
  Future<Either<Failure, bool>> login(LoginData loginData) async {
    try {
      ///TODO: implement login repository logic send data to the server...
      return Right(true);
    } on Exception catch (error) {
      return Left(Failure([error.toString()]));
    }
  }
}
