import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabelWithTrailingIcon extends StatelessWidget {
  final IconData iconData;
  final labelString;

  const LabelWithTrailingIcon({Key key, this.iconData, this.labelString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        iconData,
        color: Colors.grey,
        size: 16,
      ),
      Text(
        labelString,
        style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
            .copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
      )
    ]);
  }
}
