import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:flutter/cupertino.dart';

class ServiceTypeAndDptClassWidget extends StatelessWidget {
  final String serviceType;
  final String dptClass;

  ServiceTypeAndDptClassWidget({Key key, this.serviceType, this.dptClass})
      : super(key: key);
  double _fontSize = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() : 24;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWithTrailingIcon(
          labelString: "Reason for Call: ",
        ),
        Text(dptClass, style: TextStyle(fontSize: _fontSize)),
        LabelWithTrailingIcon(
          labelString: "Service Type: ",
        ),
        Text(
          serviceType,
          style: TextStyle(fontSize: _fontSize),
        ),
      ],
    );
  }
}
