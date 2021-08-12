import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
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
        Padding(
          padding: paddingBetwenLines,
          child: Text(
            "$streetAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: 24),
          ),
        ),
        Padding(
          padding: paddingBetwenLines,
          child: Text(
            "$locationAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: 24),
          ),
        ),
        Padding(
          padding:  paddingBetwenLines,
          child: Text(
            "$codeAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
