import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/AppBarIcon.dart';
import 'package:acme_test/appWidgets/DashboardTicketListTile.dart';
import 'package:acme_test/appWidgets/appToolbarDateIndicator.dart';
import 'package:acme_test/appWidgets/newTicketForm.dart';
import 'package:acme_test/appWidgets/simpleNavigationMenu.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:acme_test/commons/routesNames.dart';
import 'package:acme_test/dashboardPage/dashBoardState.dart';
import 'package:acme_test/dashboardPage/dashboardCubit.dart';
import 'package:acme_test/dbApi/dbApi.dart';
import 'package:acme_test/models/ListTileTicketModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() {
    return _DashboardPage();
  }
}

class _DashboardPage extends State<DashboardPage> {
  @override
  void initState() {
    ///Send to the Cubit the get tickets even to retrieve the database data
    context.read<DashboardPageCubit>().getTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _buildDashboardBody(),
    );
  }

  ///Build the UI for the current state
  ///IF success tickets list its show
  ///else error or loading indicator its show
  Widget _buildDashboardBody() {
    return BlocConsumer<DashboardPageCubit, DashboardPageState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case DashboardPageSuccessState:
              return Container(
                color: Colors.white24,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DateIndicator(),
                    Flexible(
                      child: ListView.builder(
                          itemCount: (state as DashboardPageSuccessState)
                              .ticketList
                              .length,
                          itemBuilder: (context, index) {
                            return TicketListTile(
                              model: (state as DashboardPageSuccessState)
                                  .ticketList[index],
                              onViewTicketPressed: () {
                                Navigator.of(context).pushNamed(
                                    WORK_TICKET_PAGE,
                                    arguments:
                                        (state as DashboardPageSuccessState)
                                            .ticketList[index]
                                            .id);
                              },
                            );
                          }),
                    )
                  ],
                ),
              );
            case DashboardPageCreateState:
              return SingleChildScrollView(child: NewTicketForm());
            case DashboardPageErrorState:
              return Center(child: Text((state as DashboardPageErrorState).message));
            default:
              return Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.black12),
                  )
                ],
              );
          }
        },
        listener: (context, state) async {});
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
        child: AppBar(
          elevation: 0.2,
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
              subtitle: "Calendar",
              onTap: () {},
              iconData: Icons.calendar_today_sharp,
            ),
            AppActionBtn(
              subtitle: "Sync",
              onTap: () {},
              iconData: Icons.sync,
            ),
          ],
        ),
      );

  List<Widget> _buildActions() {
    return [
      AppActionBtn(
        subtitle: "New Ticket",
        onTap: () {
          context.read<DashboardPageCubit>().startCreateForm();
        },
        iconData: Icons.add,
      ),
      SimpleMenu(
        currentPosition: 0,
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
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
      child: Text(
        "DASHBOARD",
        style: AcmeAppTheme.themeDataLight.textTheme.headline2,
      ),
    );
  }
}
