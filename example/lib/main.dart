import 'package:flutter/material.dart';
import 'package:sfdialog/core/helper/ui_helper.dart';

import 'package:sfdialog/sfdialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                final _context = navigatorKey.currentState.overlay.context;
                SFDialog.show(
                    context: _context,
                    title: "Welcome",
                    type: DialogType.info,
                    maxDescLines: 2,
                    description: "asdasdasd asd asd asd a dasd as d asd asd as das das das"
                        "asdasdasd asd asd asd a dasd as d asd asd as das das das"
                        "asdasdasd asd asd asd a dasd as d asd asd as das das das ",
                    theme: SFDialogTheme.light,
                    icon: Icon(Icons.ac_unit));
                    
              },
              child: Text("aa"),
            ),
          ),
        ),
      ),
    );
  }
}
