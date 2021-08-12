import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  final Function onPress;
  final String label;

  const RoundedButton({Key key, this.onPress, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: this.onPress,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(padding: EdgeInsets.all(16),
        
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(width: 2, color: Colors.green),
      ),
    );
  }
}
