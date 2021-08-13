import 'dart:developer';

import 'package:acme_test/models/WorkTicketModel.dart';

class ListTileTicketModel {
  final int id;
  final String dateTime;
  final String date;
  final String ticketNumber;
  final String ticketLabel;
  final String streetAddress;
  final String locationAddress;
  final String codeAddress;

  ListTileTicketModel({this.id,
    this.dateTime,
    this.date,
    this.ticketNumber,
    this.ticketLabel,
    this.streetAddress,
    this.locationAddress,
    this.codeAddress});

  factory ListTileTicketModel.fromWorkTicketModel(WorkTicketModel model) {
    var splitted = model.jobSiteAddress.split("|");
    var street = splitted[0];
    var location = "UNK";
    var code = "UNK";
    if (splitted.length == 3) {
      location = splitted[1];
      code = splitted[2];
    }
    var splitedDate = model.scheduledFor.split("/");
    return ListTileTicketModel(
        id: model.id,
        ticketNumber: model.ticketNumber,
        ticketLabel: model.customerInfo,
        streetAddress: street,
        codeAddress: code,
        locationAddress: location,
        dateTime: splitedDate[0],
        date: splitedDate[1]+ "/" + splitedDate[2]+"/"+splitedDate[3]);
  }
}
