import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/commons/pagesRoutes.dart';
import 'package:acme_test/commons/routesNames.dart';
import 'package:acme_test/dashboardPage/dashboardCubit.dart';
import 'package:acme_test/dashboardPage/dashboardPage.dart';
import 'package:acme_test/getDirectionsPage/getDirectionsCubit.dart';
import 'package:acme_test/getDirectionsPage/getDirectionsPage.dart';
import 'package:acme_test/loginPage/loginCubit.dart';
import 'package:acme_test/loginPage/loginPage.dart';
import 'package:acme_test/settings/settings.dart';
import 'package:acme_test/splashScreenPage/splashScreenCubit.dart';
import 'package:acme_test/splashScreenPage/splashScreenPage.dart';
import 'package:acme_test/workTicketPage/workTicketCubit.dart';
import 'package:acme_test/workTicketPage/workTicketPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acme_test/injectorContainer.dart' as injectorContainer;

///Material App using generated routes for navigation
class ACMEApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACME Android App Test',
      theme: AcmeAppTheme.themeDataLight,
      home: BlocProvider<SplashScreenCubit>(
        create: (_) => injectorContainer.sl<SplashScreenCubit>(),
        child: SplashScreenPage(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LOGIN_PAGE:
            return AcmePageRoute(
                builder: (_) => BlocProvider<LoginPageCubit>(
                    create: (_) => injectorContainer.sl<LoginPageCubit>(),
                    child: LoginPage()));
          case DASHBOARD_PAGE:
            return AcmePageRoute(
                builder: (_) => BlocProvider<DashboardPageCubit>(
                    create: (_) => injectorContainer.sl<DashboardPageCubit>(),
                    child: DashboardPage()));
          case WORK_TICKET_PAGE:
            return AcmePageRoute(
                builder: (_) => BlocProvider<WorkTicketPageCubit>(
                    create: (_) => injectorContainer.sl<WorkTicketPageCubit>(),
                    child: WorkTicketPage(
                      ticketId: settings.arguments,
                    )));
          case GET_DIRECTIONS_PAGE:
            return AcmePageRoute(
                builder: (_) => BlocProvider<GetDirectionsPageCubit>(
                    create: (_) =>
                        injectorContainer.sl<GetDirectionsPageCubit>(),
                    child: GetDirectionsPage()));
          default:
            return AcmePageRoute(
                builder: (_) => BlocProvider<SplashScreenCubit>(
                    create: (_) => injectorContainer.sl<SplashScreenCubit>(),
                    child: SplashScreenPage()));
        }
      },
    );
  }
}
