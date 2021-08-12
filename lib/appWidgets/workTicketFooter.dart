import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/footerButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkTicketFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          FooterButton(
            label: Text(
              "Overvew",
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                  .copyWith(color: Colors.green),
            ),
            selected: true,
          ),
          FooterButton(
            label: Text("Work Details"),
            selected: false,
          ),
          FooterButton(
            label: Text("Purchasing"),
            selected: false,
          ),
          FooterButton(
            label: Text("Finishing Up"),
            selected: false,
          ),
          FooterButton(
            label: Icon(
              Icons.camera_alt_rounded,
              size: 19,
              color: Colors.grey,
            ),
            selected: false,
          ),
        ],
      ),
    );
  }
}
