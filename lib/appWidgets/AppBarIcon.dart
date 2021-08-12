import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:flutter/material.dart';

class AppActionBtn extends StatelessWidget {
  final String subtitle;
  final Function onTap;
  final IconData iconData;

  AppActionBtn({
    Key key, this.subtitle, this.onTap, this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPaddingAppBar,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.green),
            Text(
              "$subtitle",
              style: AcmeAppTheme.themeDataLight.textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
