import 'package:flutter/material.dart';
import 'package:sfdialog/core/child/base_dialog.dart';
import '../helper/ui_helper.dart';

class InfoDialog extends StatelessWidget implements BaseDialog {
  InfoDialog({
    Key key,
    @required this.title,
    this.description,
    this.icon,
    this.buttons,
    this.theme,
    this.maxDescLines,
  }) : super(key: key);

  final String title;
  final String description;
  final Icon icon;
  final int maxDescLines;
  final List<Widget> buttons;
  final SFDialogTheme theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _infoIcon,
        titleWidget,
        space10Vertical,
        _description,
        buttonsWidget
      ],
    );
  }

  Widget get _description => Text(
        this.description ?? "",
        maxLines: maxDescLines,
        textAlign: TextAlign.center,
        style: SFUIHelper.descriptionTextStyle,
      );

  Widget get _infoIcon =>
      this.icon ??
      Icon(
        Icons.info,
        size: SFUIHelper.ICON_SIZE,
        color: Colors.blue,
      );

  @override
  List<Widget> get buttonExpandedWidget {
    List<Widget> _expanded = new List<Widget>();
    this.buttons.forEach(
          (widget) => _expanded.add(
            subListExpandedWidget(widget),
          ),
        );
    return _expanded;
  }

  @override
  Widget get buttonsWidget => buttons == null
      ? SFUIHelper.verticalSpace(height: SFUIHelper.Space10)
      : Row(
          children: buttonExpandedWidget,
        );

  @override
  Widget get space10Vertical => SFUIHelper.verticalSpace(height: 10);

  @override
  Widget subListExpandedWidget(Widget widget) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SFUIHelper.padding),
        child: widget,
      ),
    );
  }

  @override
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

  @override
  Widget get titleWidget => Text(
        title,
        textAlign: TextAlign.center,
        style: titleTextStyle,
      );
}
