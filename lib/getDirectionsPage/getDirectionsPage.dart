import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/AppBarIcon.dart';
import 'package:acme_test/appWidgets/mapWidget.dart';
import 'package:acme_test/appWidgets/placeInfoLayoutWidget.dart';
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
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        bottomNavigationBar: IntrinsicHeight(child: WorkTicketFooter()),
        body: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1 / 4,
              child: PlaceInfoLayoutWidget(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: GMap()),
          ],
        ));
  }

  Widget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(getPreferedSize()),
      child: AppBar(
        elevation: 0.2,
        leadingWidth: MediaQuery.of(context).size.width / 5,
        leading: _buildLeading(),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: _buildTitle(),
      ),
    );
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
    return (MediaQuery.of(context).size.height / 6 > 70)
        ? 70
        : MediaQuery.of(context).size.height / 6;
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
      child: Text(
        "Get Directions",
        style: AcmeAppTheme.themeDataLight.textTheme.headline2
            .copyWith(fontSize: 24),
      ),
    );
  }
}
