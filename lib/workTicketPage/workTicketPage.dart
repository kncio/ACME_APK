import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/AppBarIcon.dart';
import 'package:acme_test/appWidgets/ServiceTypeAndDptClassWidget.dart';
import 'package:acme_test/appWidgets/addressInfoWidget.dart';
import 'package:acme_test/appWidgets/dispatchNoteWidget.dart';
import 'package:acme_test/appWidgets/distanceDetails.dart';
import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:acme_test/appWidgets/roundedButton.dart';
import 'package:acme_test/appWidgets/simpleNavigationMenu.dart';
import 'package:acme_test/appWidgets/workTicketFooter.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:acme_test/commons/stringsValues.dart';
import 'package:acme_test/workTicketPage/workTicketCubit.dart';
import 'package:acme_test/workTicketPage/workTicketState.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkTicketPage extends StatefulWidget {
  final int ticketId;

  const WorkTicketPage({Key key, this.ticketId}) : super(key: key);

  @override
  _WorkTicketPage createState() {
    return _WorkTicketPage(ticketId: ticketId);
  }
}

class _WorkTicketPage extends State<WorkTicketPage> {
  final int ticketId;

  _WorkTicketPage({this.ticketId});

  double _fontSize = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() : 24;
    return BlocConsumer<WorkTicketPageCubit, WorkTicketPageState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar(),
            bottomNavigationBar: IntrinsicHeight(
              child: WorkTicketFooter(),
            ),
            body: _buildBody(),
          );
        });
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                _buildCustomerInfoWidget(),
                Spacer(),
                _buildScheduledInfoWidget()
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _directionsInfoWidget(),
                Container(
                  height: MediaQuery.of(context).size.height * 2 / 5 + _fontSize *1.5,
                  width: 1,
                  color: Colors.black12,
                ),
                Column(
                  children: [
                    DispatchNoteWidget(
                      noteText: "$text1String",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 8),
                      child: ServiceTypeAndDptClassWidget(
                        dptClass: "Plumping",
                        serviceType: "Call Back",
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 40,
              color: Colors.grey,
            ),
            _buildReasonForCallDetails(),
          ],
        ),
      ),
    );
  }

  //TODO: to implement dynamic data fill
  Widget _buildReasonForCallDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 0, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reason For Call:",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: _fontSize),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  "- Customer has noticed extremely low water pressure from the sink.",
                  style:
                      AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
                    fontSize: _fontSize - 2,
                    fontWeight: FontWeight.w600,
                  )),
              Text("- Precision tune up.",
                  style:
                      AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
                    fontSize: _fontSize - 2,
                    fontWeight: FontWeight.w600,
                  )),
              AutoSizeText("- Estimate for panel upgrade.",
                  style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                      .copyWith(
                          fontSize: _fontSize - 2, fontWeight: FontWeight.w600))
            ]),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
            child: Text("Ticket #32787",
                textAlign: TextAlign.start,
                style: AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
                    fontSize: _fontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _directionsInfoWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 5,
      width: MediaQuery.of(context).size.width / 2 - 1,
      child: Padding(
        padding: defaultWorkTicketTextPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelWithTrailingIcon(
                  iconData: Icons.location_on_outlined,
                  labelString: jobSiteAddressLabelString,
                ),
                _addressInfoWidget(),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: DistanceDetailsWidget(
                      time: "Approx. 17 Minutes",
                      miles: "11.9 miles",
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            RoundedButton(label: "Get Directions", onPress: () {})
          ],
        ),
      ),
    );
  }

  Widget _addressInfoWidget() {
    //TODO: address info must be getted from dynamic data
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,0),
      child: AddressInfoWidget(
        streetAddr: "27 Brookview Dr",
        locationAddr: "North York, ON",
        codeAddr: "M6A 2k4",
      ),
    );
  }

  Widget _buildCustomerInfoWidget() {
    return Padding(
      padding: defaultWorkTicketTextPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customerInfoLabelString,
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: _fontSize),
          ),
          Row(
            children: [
              Text(
                "Jessica Green",
                style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                    .copyWith(color: Colors.black54, fontSize: _fontSize),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Icon(
                  Icons.local_phone_rounded,
                  size: 16,
                  color: Colors.green,
                ),
              ),
              Text(
                "519 733 8787",
                style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                    .copyWith(fontSize: _fontSize),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildScheduledInfoWidget() {
    return Padding(
      padding: defaultWorkTicketTextPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scheduledForLabelString,
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: _fontSize),
          ),
          Text(
            "Saturday, Dec 24, 2016 11:54 AM",
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(fontSize: _fontSize),
          )
        ],
      ),
    );
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
          actions: _buildActions(),
        ),
        preferredSize: Size.fromHeight(getPreferedSize()));
  }

  Container _buildLeading() => Container(
        width: MediaQuery.of(context).size.width / 5,
        child: Row(
          children: [
            AppActionBtn(
              subtitle: "Dashboard",
              onTap: () {
                Navigator.of(context).pop();
              },
              iconData: Icons.keyboard_arrow_left_outlined,
            ),
          ],
        ),
      );

  List<Widget> _buildActions() {
    return [
      SimpleMenu(
        currentPosition: 1,
      )
    ];
  }

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
