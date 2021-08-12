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

  ListTileTicketModel(
      {this.id,
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
    var location = splitted[1];
    var code = splitted[2];
    return ListTileTicketModel(
        id: model.id,
        ticketNumber: model.ticketNumber,
        ticketLabel: model.customerInfo,
        streetAddress: street,
        codeAddress: code,
        locationAddress: location,
        dateTime: "13:50 PM",
        date: "12/24/16");
  }
}
