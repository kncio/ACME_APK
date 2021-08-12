import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: useJIFFY for date
    return Container(
      color: Colors.white10,
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.fromLTRB(32, 10, 0, 10),
          child: Text("Dec 24, 2016")),
    );
  }
}
