import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:acme_test/commons/stringsValues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DistanceDetailsWidget extends StatelessWidget {
  final String time;
  final String miles;

  const DistanceDetailsWidget({Key key, this.time, this.miles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWithTrailingIcon(
            iconData: Icons.gps_fixed_sharp,
            labelString: distanceLabelString,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              "$time",
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                  .copyWith(color: Colors.black54, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              "$miles",
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                  .copyWith(color: Colors.black54, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
