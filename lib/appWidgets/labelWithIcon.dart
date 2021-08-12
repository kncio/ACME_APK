import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabelWithTrailingIcon extends StatelessWidget {
  final IconData iconData;
  final labelString;

  LabelWithTrailingIcon({Key key, this.iconData, this.labelString})
      : super(key: key);

  double _fontSize = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs()*3/4 : 24;
    return Row(children: [
      Icon(
        iconData,
        color: Colors.grey,
        size: 16,
      ),
      Text(
        labelString,
        style: AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
            fontWeight: FontWeight.w600, color: Colors.grey, fontSize: _fontSize),
      )
    ]);
  }
}
