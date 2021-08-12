import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///This button its a foo widget only for demostration
class FooterButton extends StatelessWidget {
  final bool selected;
  final Widget label;

  const FooterButton({Key key, this.selected, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2,0,2,0),
        child: Container(
          color: Colors.black12,
          child: Column(
            children: [
              Container(height: 2,
                color: (selected) ? Colors.green : Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: label
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
