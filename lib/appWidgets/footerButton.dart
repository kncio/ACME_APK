import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///This button its a foo widget only for demostration
class FooterButton extends StatelessWidget {
  final bool selected;
  final Widget label;

  FooterButton({Key key, this.selected, this.label}) : super(key: key);

  double _padding = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 35;
    log(mqH.toString());
    _padding = (mqH < 24) ? mqH.abs() : 24;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: Container(
          color: Colors.black12,
          child: Column(
            children: [
              Container(
                height: 2,
                color: (selected) ? Colors.green : Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.all(_padding),
                child: Center(child: label),
              )
            ],
          ),
        ),
      ),
    );
  }
}
