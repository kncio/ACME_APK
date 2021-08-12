import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/roundedButton.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:acme_test/models/ListTileTicketModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketListTile extends StatelessWidget {
  final ListTileTicketModel model;
  final Function onViewTicketPressed;

  const TicketListTile({Key key, this.model, this.onViewTicketPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Padding(
      padding: defaultPaddingListTiles,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        elevation: 0,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dateContainer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: VerticalDivider(color: Colors.black38),
            ),
            detailsContainer(),
            Spacer(),
            Center(
              child: Padding(
                padding: defaultInterPaddingListTiles,
                child: RoundedButton(
                  onPress: this.onViewTicketPressed,
                  label: "View Ticket",
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget dateContainer() {
    return Padding(
      padding: defaultInterPaddingListTiles,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${model.dateTime}",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2,
          ),
          Text(
            "${model.date}",
            style: AcmeAppTheme.themeDataLight.textTheme.subtitle2,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              "Ticket #${model.ticketNumber}",
              style: AcmeAppTheme.themeDataLight.textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsContainer() {
    return Padding(
      padding: defaultInterPaddingListTiles,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${model.ticketLabel}",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2,
          ),
          Text(
            "${model.streetAddress}",
            style: AcmeAppTheme.themeDataLight.textTheme.subtitle2,
          ),
          Text(
            "${model.locationAddress}",
            style: AcmeAppTheme.themeDataLight.textTheme.subtitle2,
          ),
          Text(
            "${model.codeAddress}",
            style: AcmeAppTheme.themeDataLight.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
