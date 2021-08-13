import 'dart:async';
import 'dart:developer';

import 'package:acme_test/commons/stringsValues.dart';
import 'package:acme_test/models/ListTileTicketModel.dart';
import 'package:acme_test/models/WorkTicketModel.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBApi {
  final database;
  final String columnId = "id";

  DBApi(this.database) {
    ///Fill the database with data for test visualization
    var newTicket = WorkTicketModel(
        id: 123,
        customerInfo: "Jessica Green",
        jobSiteAddress: "AN Address|A Location, ON|ACO DE9",
        distance: "11.8 miles",
        dispatchNote: text1String,
        scheduledFor: "11:00/8/6/2021",
        deptClass: "Plumping",
        serviceType: "Call Back",
        reasonForCall: "Lorep ipsum",
        ticketNumber: "43789");

    this.insertTicket(newTicket);
  }

  // Define a function that inserts dogs into the database
  Future<void> insertTicket(WorkTicketModel ticket) async {
    // Get a reference to the database.
    final db = await database;
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'tickets',
      ticket.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<ListTileTicketModel>> getTickets() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('tickets');

    // Convert the List<Map<String, dynamic> into a List<TicketModel>.
    var ticketModels = List.generate(maps.length, (i) {
      return WorkTicketModel(
          id: maps[i]["id"],
          customerInfo: maps[i]["customerInfo"],
          jobSiteAddress: maps[i]["jobSiteAddress"],
          distance: maps[i]["distance"],
          dispatchNote: maps[i]["dispatchNote"],
          scheduledFor: maps[i]["scheduledFor"],
          deptClass: maps[i]["deptClass"],
          serviceType: maps[i]["serviceType"],
          reasonForCall: maps[i]["reasonForCall"],
          ticketNumber: maps[i]["ticketNumber"]);
    });
    return List.generate(ticketModels.length, (i) {
      return ListTileTicketModel.fromWorkTicketModel(ticketModels[i]);
    });
  }

  //Get a WorkTicketModel by id
  Future<WorkTicketModel> getWorkTicketModel(int id) async {

    var db = await database;
    List<Map> maps = await db.query('tickets',
        columns: [
          "id",
          "customerInfo",
          "jobSiteAddress",
          "distance",
          "dispatchNote",
          "scheduledFor",
          "deptClass",
          "serviceType",
          "reasonForCall",
          "ticketNumber"
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return WorkTicketModel.fromMap(maps.first);
    }
    return null;
  }
}
