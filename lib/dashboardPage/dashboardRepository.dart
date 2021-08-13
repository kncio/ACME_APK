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

  /// Tickets list from the database and prepare for the View
  Future<Either<Failure, List<ListTileTicketModel>>> loadStoredTickets() async {
    try {
      var result = await database.getTickets();

      return Right(result);
    } catch (e) {
      return Left(Failure([e.toString()]));
    }
  }
}
