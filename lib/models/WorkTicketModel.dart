import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WorkTicketModel {
  final int id;
  final String customerInfo;
  final String jobSiteAddress;
  final String distance;
  final String dispatchNote;
  final String scheduledFor;
  final String deptClass;
  final String serviceType;
  final String reasonForCall;
  final String ticketNumber;

  WorkTicketModel(
      {this.id,
      this.customerInfo,
      this.jobSiteAddress,
      this.distance,
      this.dispatchNote,
      this.scheduledFor,
      this.deptClass,
      this.serviceType,
      this.reasonForCall,
      this.ticketNumber});

  // Convert a WorkTicketModel into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "customerInfo": this.customerInfo,
      "jobSiteAddress": this.jobSiteAddress,
      "distance": this.distance,
      "dispatchNote": this.dispatchNote,
      "scheduledFor": this.scheduledFor,
      "deptClass": this.deptClass,
      "serviceType": this.serviceType,
      "reasonForCall": this.reasonForCall,
      "ticketNumber": this.ticketNumber
    };
  }

  factory WorkTicketModel.fromMap(Map<String, dynamic> map) => WorkTicketModel(
        id: map["id"],
        customerInfo: map["customerInfo"],
        jobSiteAddress: map["jobSiteAddress"],
        distance: map["distance"],
        dispatchNote: map["dispatchNote"],
        scheduledFor: map["scheduledFor"],
        deptClass: map["deptClass"],
        serviceType: map["serviceType"],
        reasonForCall: map["reasonForCall"],
        ticketNumber: map["ticketNumber"],
      );
}
