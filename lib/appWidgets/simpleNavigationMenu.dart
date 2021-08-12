import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:acme_test/commons/routesNames.dart';
import 'package:flutter/material.dart';

class SimpleMenu extends StatelessWidget {
  final int currentPosition;

  const SimpleMenu({Key key, this.currentPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Padding(
        padding: defaultPaddingAppBar,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, color: Colors.green),
            Text(
              "Menu",
              style: AcmeAppTheme.themeDataLight.textTheme.subtitle1,
            )
          ],
        ),
      ),
      // icon: Icon(Icons.menu, color: Colors.green),
      itemBuilder: (context) {
        var list = <PopupMenuEntry>[];

        // ignore: unnecessary_statements
        (currentPosition != 0)
            ? list.add(PopupMenuItem(
                child: Text("Dashboard"),
                value: 0,
              ))
            // ignore: unnecessary_statements
            : null;
        (currentPosition != 1)
            ? list.add(PopupMenuItem(child: Text("WorkTicket"), value: 1))
            // ignore: unnecessary_statements
            : null;
        (currentPosition != 2)
            ? list.add(PopupMenuItem(child: Text("GetDirections"), value: 2))
            :
            // ignore: unnecessary_statements
            null;

        return list;
      },
      onSelected: (value) {
        switch (value) {
          case 0:
            return Navigator.of(context).pushNamedAndRemoveUntil(
                DASHBOARD_PAGE, ModalRoute.withName("/"));
          case 1:
            return Navigator.of(context)
                .pushNamed(WORK_TICKET_PAGE, arguments: null);
          default:
            return Navigator.of(context)
                .pushNamed(GET_DIRECTIONS_PAGE);
        }
      },
    );
  }
}
