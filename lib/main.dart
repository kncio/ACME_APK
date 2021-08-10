import 'package:acme_test/acmeMaterialApp.dart';
import 'package:flutter/material.dart';
import 'package:acme_test/injectorContainer.dart' as injectorContainer;
import 'package:flutter/services.dart';

void main() {
  //region Prevent PortraitMode Mode
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //endregion

  initialize().whenComplete(() => {
    //! Run the APP
    runApp(ACMEApp())
  });
}

Future<void> initialize() async {
  injectorContainer.init();
}