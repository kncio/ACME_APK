import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/labelWithIcon.dart';
import 'package:acme_test/commons/dimensionsValues.dart';
import 'package:acme_test/commons/stringsValues.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DispatchNoteWidget extends StatelessWidget {
  final String noteText;

  const DispatchNoteWidget({Key key, this.noteText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultWorkTicketTextPadding,
      height: MediaQuery.of(context).size.height / 3 + 10,
      width: MediaQuery.of(context).size.width / 2 - 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: LabelWithTrailingIcon(
              iconData: Icons.assignment,
              labelString: dispatchNoteLabelString,
            ),
          ),
          AutoSizeText(
            noteText,
            style: AcmeAppTheme.themeDataLight.textTheme.bodyText2
                .copyWith(fontSize: 20),
            maxLines: 10,
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
