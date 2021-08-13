import 'dart:developer';

import 'package:acme_test/commons/routesNames.dart';
import 'package:acme_test/settings/settings.dart';
import 'package:acme_test/splashScreenPage/logoImageWidget.dart';
import 'package:acme_test/splashScreenPage/splashScreenCubit.dart';
import 'package:acme_test/splashScreenPage/splashScreenState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  double logoWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) async {
      if (state is SplashScreenAppInitializedSuccess) {
        Future.delayed(Duration(seconds: 3, milliseconds: 500)).whenComplete(
          () {
            //When finish Animation Navigate to login page and clear the navigation stack
            Navigator.of(context).pushReplacementNamed(LOGIN_PAGE);
          },
        );
      } else if (state is SplashScreenError) {
      } else if (state is SplashScreenAnimationStartState) {
        setState(() {
          this.logoWidth = MediaQuery.of(context).size.width * 3 / 4;
        });
      }
    }, builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Row(children: [
            Spacer(flex: 3),
            AnimatedContainer(
              width: this.logoWidth,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(seconds: 3),
              child: LogoImage(),
            ),
            Spacer(flex: 1),
          ]),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  decorationStyle: TextDecorationStyle.solid,
                ),
                children: [
                  TextSpan(
                    text: 'Version: 1.0.0\nCopyright \u00a9 2021 - ',
                  ),
                  TextSpan(
                    text: 'ACME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    requestPermissions().then(
      (value2) => context.read<SplashScreenCubit>().start(),
    );
  }

  //Request Permission
  Future<Map<Permission, PermissionStatus>> requestPermissions() async {
    Map<Permission, PermissionStatus> status = await Settings.requestPermission(
        permissionsToRequest: [Permission.storage]);
    if (status.entries.any((element) => element.value.isDenied))
      return await requestPermissions();
    return status;
  }
}
