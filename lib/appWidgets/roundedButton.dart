import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  final Function onPress;
  final String label;

  RoundedButton({Key key, this.onPress, this.label}) : super(key: key);
  double _fontSize = 24;

  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs() : 24;
    return OutlinedButton(
      onPressed: this.onPress,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: _fontSize),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(width: 2, color: Colors.green),
      ),
    );
  }
}
