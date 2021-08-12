import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:acme_test/commons/stringsValues.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DispatchNoteWidget extends StatelessWidget {
  final String noteText;

  DispatchNoteWidget({Key key, this.noteText}) : super(key: key);

  double _fontSize = 24;
  bool _smallScreen = false;
  @override
  Widget build(BuildContext context) {
    var mqH = MediaQuery.of(context).size.height / 24;
    _fontSize = (mqH < 24) ? mqH.abs()*2/3 : 24;
    _smallScreen = (mqH < 24);
    return Container(
      padding: (_smallScreen)?EdgeInsets.fromLTRB(0, 8, 0, 0):EdgeInsets.fromLTRB(0, 20, 0, 0),
      height: MediaQuery.of(context).size.height * 2 / 5,
      width: MediaQuery.of(context).size.width / 2 - 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
            child: LabelWithTrailingIcon(
              iconData: Icons.assignment,
              labelString: dispatchNoteLabelString,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
            child: AutoSizeText(
              noteText,
              style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                  .copyWith(fontSize: _fontSize),
              maxLines: 10,overflow: TextOverflow.clip,
            ),
          ),
          Spacer(),
          Divider(
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
