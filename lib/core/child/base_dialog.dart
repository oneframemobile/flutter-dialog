import 'package:flutter/material.dart';

import '../helper/ui_helper.dart';

class BaseDialog {
  final String title;
  final SFDialogTheme theme;
  final List<Widget> buttons;

  BaseDialog(this.title, this.theme, this.buttons);

  Widget get titleWidget => Text(
        title,
        style: titleTextStyle,
      );

  TextStyle get titleTextStyle {
    switch (this.theme) {
      case SFDialogTheme.medium:
        return SFUIHelper.titleTextStyle;

      case SFDialogTheme.light:
        return SFUIHelper.titleTextThinStyle;

      case SFDialogTheme.bold:
        return SFUIHelper.titleTextBoldStyle;

      default:
        return SFUIHelper.titleTextStyle;
    }
  }

  Widget get buttonsWidget => buttons == null
      ? SFUIHelper.verticalSpace(height: SFUIHelper.Space10)
      : Row(
          children: buttonExpandedWidget,
        );

  List<Widget> get buttonExpandedWidget {
    List<Widget> _expanded = new List<Widget>();
    this.buttons.forEach(
          (widget) => _expanded.add(
            subListExpandedWidget(widget),
          ),
        );
    return _expanded;
  }

  Widget subListExpandedWidget(Widget widget) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SFUIHelper.padding),
          child: widget,
        ),
      );

  Widget get space10Vertical => SFUIHelper.verticalSpace(height: 10);
}
