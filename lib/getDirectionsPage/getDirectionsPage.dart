import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/AppBarIcon.dart';
import 'package:acme_test/appWidgets/workTicketFooter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetDirectionsPage extends StatefulWidget {
  @override
  _GetDirectionsPage createState() {
    return _GetDirectionsPage();
  }
}

class _GetDirectionsPage extends State<GetDirectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(),bottomNavigationBar: WorkTicketFooter(),);
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
        child: AppBar(
          elevation: 1,
          leadingWidth: MediaQuery.of(context).size.width / 5,
          leading: _buildLeading(),
          centerTitle: true,
          backgroundColor: Colors.white70,
          title: _buildTitle(),
        ),
        preferredSize: Size.fromHeight(getPreferedSize()));
  }

  Container _buildLeading() => Container(
        width: MediaQuery.of(context).size.width / 5,
        child: Row(
          children: [
            AppActionBtn(
              subtitle: "Ticket",
              onTap: () {
                Navigator.of(context).pop();
              },
              iconData: Icons.keyboard_arrow_left_outlined,
            ),
          ],
        ),
      );

  ///Return the min between screenHeightSize/6 and 75
  double getPreferedSize() {
    return (MediaQuery.of(context).size.height / 6 > 75)
        ? 75
        : MediaQuery.of(context).size.height / 6;
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
      child: Text(
        "Work Ticket",
        style: AcmeAppTheme.themeDataLight.textTheme.headline2
            .copyWith(color: Colors.grey, fontSize: 24),
      ),
    );
  }
}
