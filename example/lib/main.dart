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
                    description: "aa",
                    theme: SFDialogTheme.light,
                    icon: Icons.ac_unit);
                    
              },
              child: Text("aa"),
            ),
          ),
        ),
      ),
    );
  }
}
