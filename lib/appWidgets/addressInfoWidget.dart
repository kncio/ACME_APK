import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressInfoWidget extends StatelessWidget {
  final String streetAddr;
  final String locationAddr;
  final String codeAddr;

  AddressInfoWidget(
      {Key key, this.streetAddr, this.locationAddr, this.codeAddr})
      : super(key: key);

  double _fontSize = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() : 24;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: paddingBetwenLines,
          child: Text(
            "$streetAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: _fontSize),
          ),
        ),
        Padding(
          padding: paddingBetwenLines,
          child: Text(
            "$locationAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: _fontSize),
          ),
        ),
        Padding(
          padding: paddingBetwenLines,
          child: Text(
            "$codeAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: _fontSize),
          ),
        ),
      ],
    );
  }
}
