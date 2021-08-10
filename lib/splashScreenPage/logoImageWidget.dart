
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      // height: MediaQuery.of(context).size.height * 2 / 13,
      child: Image.asset(
        'assets/app_logo.png',
        fit: BoxFit.fitWidth,

      ),
    );
  }
}