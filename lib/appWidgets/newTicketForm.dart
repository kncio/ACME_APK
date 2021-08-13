import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/roundedButton.dart';
import 'package:acme_test/commons/routesNames.dart';
import 'package:acme_test/dbApi/dbApi.dart';
import 'package:acme_test/models/WorkTicketModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:acme_test/injectorContainer.dart' as ic;

class NewTicketForm extends StatefulWidget {
  @override
  _NewTicketForm createState() {
    return _NewTicketForm();
  }
}

class _NewTicketForm extends State<NewTicketForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime _dateTime = DateTime.now();
  String _customerInfo = "";
  String _customerAddr = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Fill the New Ticket Data",
                  style: AcmeAppTheme.themeDataLight.textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This Field its mandatory";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _customerInfo = newValue;
                    });
                  },
                  style: TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  decoration: AcmeAppTheme.textFormFieldDecoration(
                      labelText: "Customer Name",
                      hintText: "Customer Name",
                      prefixIconData: Icon(Icons.account_circle_outlined)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This Field its mandatory";
                    }
                    if (value.split("|").length != 3) {
                      return "Street|Loaction|Code";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _customerAddr = newValue;
                    });
                  },
                  style: TextStyle(color: Colors.black54),
                  textInputAction: TextInputAction.next,
                  decoration: AcmeAppTheme.textFormFieldDecoration(
                      labelText: "Address",
                      hintText: "Address",
                      prefixIconData: Icon(Icons.account_circle_outlined)),
                ),
              ),
              Text("Due Date"),
              CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2016),
                  lastDate: DateTime(2116),
                  onDateChanged: (dateTime) {
                    setState(() {
                      this._dateTime = dateTime;
                    });
                  }),
              Row(children: [
                RoundedButton(
                  label: "Back",
                  onPress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        DASHBOARD_PAGE, ModalRoute.withName("/"));
                  },
                ),
                Spacer(),
                RoundedButton(
                  label: "Create",
                  onPress: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      var newTicket = WorkTicketModel(
                          customerInfo: _customerInfo,
                          scheduledFor: _formatDateString().toString(),
                          jobSiteAddress: _customerAddr,
                          distance: "12.5 miles",
                          deptClass: "Plumping",
                          serviceType: "Call Back",
                          reasonForCall: "Lren ipsun example textum",
                          ticketNumber: "9898",
                          dispatchNote:
                              "One text,Lorem ipsum, mea culpa example text");
                      //insert the new ticket
                      var repo = ic.sl<NewTicketRepository>();
                      repo.createNewTicket(newTicket).whenComplete(() => {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                DASHBOARD_PAGE, ModalRoute.withName("/"))
                          });
                    }
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateString() {
    var dateString = "";
    return dateString +
        DateTime.now().hour.toString() +
        ":" +
        DateTime.now().minute.toString() +
        "/" +
        _dateTime.month.toString() +
        "/" +
        _dateTime.day.toString() +
        "/" +
        _dateTime.year.toString();
  }
}

class NewTicketRepository {
  final DBApi database;

  NewTicketRepository(this.database);

  Future<void> createNewTicket(WorkTicketModel newTicket) async {
    await database.insertTicket(newTicket);
  }
}
