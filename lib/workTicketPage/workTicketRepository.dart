import 'package:acme_test/commons/failure.dart';
import 'package:acme_test/dbApi/dbApi.dart';
import 'package:acme_test/models/WorkTicketModel.dart';
import 'package:dartz/dartz.dart';

class WorkTicketRepository {
  final DBApi databaseApi;

  WorkTicketRepository(this.databaseApi);

  Future<Either<Failure, WorkTicketModel>> loadWorkTicketById(int id) async {
    try {
      var targetId = (id == null) ? 123 : id;
      var result = await databaseApi.getWorkTicketModel(targetId);
      return Right(result);
    } catch (e) {
      return Left(Failure([e.toString()]));
    }
  }

//Fetch the data from database
}
