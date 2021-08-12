import 'dart:developer';

import 'package:acme_test/commons/stringsValues.dart';
import 'package:acme_test/dbApi/dbApi.dart';
import 'package:acme_test/models/ListTileTicketModel.dart';
import 'package:acme_test/models/WorkTicketModel.dart';
import 'package:dartz/dartz.dart';
import 'package:acme_test/commons/failure.dart';

class DashboardPageRepository {
  final DBApi database;

  DashboardPageRepository({this.database});

  Future<Either<Failure, List<ListTileTicketModel>>> loadStoredTickets() async {
    try {

      var result = await database.getTickets();
      log(result.length.toString() + result[0].id.toString());
      return Right(result);
    } catch (e) {
      return Left(Failure([e.toString()]));
    }
  }

}
