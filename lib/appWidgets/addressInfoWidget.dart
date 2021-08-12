import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressInfoWidget extends StatelessWidget {
  final String streetAddr;
  final String locationAddr;
  final String codeAddr;

  const AddressInfoWidget(
      {Key key, this.streetAddr, this.locationAddr, this.codeAddr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$streetAddr",
          style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
              .copyWith(color: Colors.black54, fontSize: 18),
        ),
        Text(
          "$locationAddr",
          style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
              .copyWith(color: Colors.black54, fontSize: 18),
        ),
        Text(
          "$codeAddr",
          style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
              .copyWith(color: Colors.black54, fontSize: 18),
        ),
      ],
    );
  }
}
