import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:flutter/cupertino.dart';

class ServiceTypeAndDptClassWidget extends StatelessWidget {
  final String serviceType;
  final String dptClass;

  const ServiceTypeAndDptClassWidget({Key key, this.serviceType, this.dptClass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWithTrailingIcon(
            labelString: "Reason for Call: ",
          ),
          Text(dptClass),
          LabelWithTrailingIcon(
            labelString: "Service Type: ",
          ),
          Text(serviceType),
        ],
      ),
    );
  }
}
