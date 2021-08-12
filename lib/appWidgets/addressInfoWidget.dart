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
  bool _smallScreen = false;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() * 2 / 3 : 24;
    _smallScreen = (mqH < 24);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: (_smallScreen) ? EdgeInsets.all(1) : paddingBetwenLines,
          child: Text(
            "$streetAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: _fontSize),
          ),
        ),
        Padding(
          padding: (_smallScreen) ? EdgeInsets.all(1) : paddingBetwenLines,
          child: Text(
            "$locationAddr",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(color: Colors.black54, fontSize: _fontSize),
          ),
        ),
        Padding(
          padding: (_smallScreen) ? EdgeInsets.all(1) : paddingBetwenLines,
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
