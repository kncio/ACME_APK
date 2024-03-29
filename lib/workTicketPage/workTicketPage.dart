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
import 'package:acme_test/commons/routesNames.dart';
import 'package:acme_test/commons/stringsValues.dart';
import 'package:acme_test/models/WorkTicketModel.dart';
import 'package:acme_test/workTicketPage/workTicketCubit.dart';
import 'package:acme_test/workTicketPage/workTicketState.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Since this layout its made for demos, most of the data filled its static
///Only Customer Name, Address and Scheduled time are setet when a ticket its created on Dashboard
class WorkTicketPage extends StatefulWidget {
  final int ticketId;

  const WorkTicketPage({Key key, this.ticketId}) : super(key: key);

  @override
  _WorkTicketPage createState() {
    return _WorkTicketPage(ticketId: ticketId);
  }
}

class _WorkTicketPage extends State<WorkTicketPage> {
  ///Ticket ID for show the selected ticket data,
  ///If null, first database entry its show
  final int ticketId;

  _WorkTicketPage({this.ticketId});

  double _fontSize = 24;
  bool _smallScreen = false;
  WorkTicketModel model;

  @override
  void initState() {
    context.read<WorkTicketPageCubit>().getWorkTicketById(ticketId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() : 24;
    _smallScreen = (mqH < 24);
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: IntrinsicHeight(
        child: WorkTicketFooter(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<WorkTicketPageCubit, WorkTicketPageState>(
        listener: (context, state) async {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WorkTicketPageSuccessState:
              model = (state as WorkTicketPageSuccessState).model;
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
                            height: MediaQuery.of(context).size.height * 2 / 5 +
                                _fontSize * 1.5,
                            width: 1,
                            color: Colors.black12,
                          ),
                          Column(
                            children: [
                              DispatchNoteWidget(
                                noteText: model.dispatchNote,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 2, 0, 8),
                                child: ServiceTypeAndDptClassWidget(
                                  dptClass: model.deptClass,
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
            case WorkTicketPageErrorState:
              return Container(
                child: Center(
                  child: Text((state as WorkTicketPageErrorState).message),
                ),
              );
            default:
              return Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black12,
                    ),
                  )
                ],
              );
          }
        });
  }

  //This widgets show data for demo only, in real world scenario data must be fetched from the model
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
            child: Text("Ticket #$ticketId",
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

  ///Build the directions and address Information Layout
  Widget _directionsInfoWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 5,
      width: MediaQuery.of(context).size.width / 2 - 1,
      child: Padding(
        padding: (_smallScreen)
            ? defaultSmallWorkTicketTextPadding
            : defaultWorkTicketTextPadding,
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
                      miles: model.distance,
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            RoundedButton(
                label: "Get Directions",
                onPress: () {
                  Navigator.of(context).pushNamed(GET_DIRECTIONS_PAGE);
                })
          ],
        ),
      ),
    );
  }

  Widget _addressInfoWidget() {
    //TODO: address info must be fetched from dynamic data using the ticket id in args
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                model.customerInfo,
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
              //Static content for
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

  ///Scheduled information Layout
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
            model.scheduledFor,
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

  ///Return the min between screenHeightSize/6 and 75 for size the custom appbar
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
