import 'package:acme_test/dashboardPage/dashboardCubit.dart';
import 'package:acme_test/dashboardPage/dashboardRepository.dart';
import 'package:acme_test/dbApi/dbApi.dart';
import 'package:acme_test/loginPage/loginCubit.dart';
import 'package:acme_test/loginPage/loginRepository.dart';
import 'package:acme_test/splashScreenPage/splashScreenCubit.dart';
import 'package:acme_test/splashScreenPage/splashScreenRepository.dart';
import 'package:acme_test/workTicketPage/workTicketCubit.dart';
import 'package:acme_test/workTicketPage/workTicketRepository.dart';
import 'package:get_it/get_it.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'commons/stringsValues.dart';

final sl = GetIt.instance;

///This file store at sl all the functional singleton classes and Factories that will be injected.
/// init method must be called in app initialization
Future<void> init() async {
  //region SplashScreen
  sl.registerFactory(() => SplashScreenCubit(repository: sl()));

  sl.registerFactory(() => SplashScreenRepository());
  //endregion

  //region Login
  sl.registerFactory(() => LoginPageCubit(repository: sl()));

  sl.registerFactory(() => LoginPageRepository());
  //endregion

  //region Dashboard
  sl.registerFactory(() => DashboardPageCubit(repository: sl()));

  sl.registerFactory(() => DashboardPageRepository(database: sl()));
  //endregion

  //region Dashboard
  sl.registerFactory(() => WorkTicketPageCubit(repository: sl()));

  sl.registerFactory(() => WorkTicketRepository());
  //endregion

  var database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), dbName),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        createTicketTable,
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  // var dbInstance = new DBApi(database = database);
  // sl.registerSingleton(dbInstance,instanceName: "db_instance");
  sl.registerLazySingleton<DBApi>(() => DBApi(database = database));
}
