import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/splashScreenPage/splashScreenCubit.dart';
import 'package:acme_test/splashScreenPage/splashScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acme_test/injectorContainer.dart' as injectorContainer;

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
        //   home: ShopCartPage(),
      ),
    );
  }
}
