import 'package:flutter/cupertino.dart';

const EdgeInsetsGeometry defaultPaddingAppBar =
    EdgeInsets.fromLTRB(16, 8, 16, 0);

const EdgeInsetsGeometry defaultPaddingListTiles =
    EdgeInsets.fromLTRB(32, 8, 32, 8);

const EdgeInsetsGeometry defaultInterPaddingListTiles = EdgeInsets.all(18);

const EdgeInsetsGeometry defaultWorkTicketTextPadding = EdgeInsets.all(20);

const EdgeInsetsGeometry defaultSmallWorkTicketTextPadding = EdgeInsets.all(8);

const EdgeInsetsGeometry paddingBetwenLines = EdgeInsets.fromLTRB(0, 4, 0, 4);

const EdgeInsetsGeometry defaultIconPadding = EdgeInsets.fromLTRB(16, 16, 16, 16);

class GetDimensions {
  static double getIconSizeByBuildContext(BuildContext context) {
    var mqH = (MediaQuery.of(context).size.height / 18).toDouble();
    var size = (mqH < 24) ? mqH.abs() : 24.0;
    return size;
  }
}
