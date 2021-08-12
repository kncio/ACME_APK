import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/footerButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkTicketFooter extends StatelessWidget {
  double _fontSize = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() : 24;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          FooterButton(
            label: Text(
              "Overvew",
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                  .copyWith(color: Colors.green, fontSize: _fontSize),
            ),
            selected: true,
          ),
          FooterButton(
            label: Text(
              "Work Details",
              style: TextStyle(fontSize: _fontSize),
            ),
            selected: false,
          ),
          FooterButton(
            label: Text(
              "Purchasing",
              style: TextStyle(fontSize: _fontSize),
            ),
            selected: false,
          ),
          FooterButton(
            label: Text(
              "Finishing Up",
              style: TextStyle(fontSize: _fontSize),
            ),
            selected: false,
          ),
          FooterButton(
            label: Icon(
              Icons.camera_alt_rounded,
              size: 28,
              color: Colors.grey,
            ),
            selected: false,
          ),
        ],
      ),
    );
  }
}
