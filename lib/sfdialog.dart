library sfdialog;

import 'package:flutter/material.dart';

import 'core/dialog.dart';
import 'core/helper/ui_helper.dart';

class SFDialog {
  /// Must be required [title],[type],[context] item.
  /// or use custom widget.
  /// This statement return starforce ui design.
  static void show({
    Widget child,
    String description,
    IconData icon,
    @required String title,
    @required DialogType type,
    SFDialogTheme theme,
    List<Widget> buttons,
    List<TextField> inputs,
    bool barrierDismissible,
    @required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (BuildContext context) =>
          child ??
          StarforceDialog(
            title: title,
            description: description,
            type: type,
            theme : theme,
            fields: inputs,
            buttons: buttons,
            icon: icon,
          ),
    );
  }
}
