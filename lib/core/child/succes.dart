import '../helper/ui_helper.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  SuccessDialog({
    Key key,
    @required this.title,
    this.description,
    this.icon,
    this.buttons,
    this.maxDescLines,
    this.maxTitleLines,
  }) : super(key: key);
  final String title;
  final String description;
  final Icon icon;
  final int maxDescLines;
  final int maxTitleLines;
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_infoIcon, _title, _space, _description, _buttons],
    );
  }

  List<Widget> get _buttonExpanded {
    List<Widget> _expanded = new List<Widget>();
    this.buttons.forEach(
          (widget) => _expanded.add(_subListExpandedWidget(widget)),
        );
    return _expanded;
  }

  Widget _subListExpandedWidget(Widget widget) => Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: widget,
        ),
      );

  Widget get _buttons => buttons == null
      ? SFUIHelper.verticalSpace(height: 10)
      : Row(
          children: _buttonExpanded,
        );

  Widget get _title => Text(
        this.title,
        maxLines: maxTitleLines,
        style: SFUIHelper.titleTextStyle,
      );

  Widget get _description => Text(
        this.description ?? "",
        textAlign: TextAlign.center,
        maxLines: maxDescLines,
        style: SFUIHelper.descriptionTextStyle,
        overflow: TextOverflow.ellipsis,
      );

  Widget get _infoIcon => Icon(this.icon ?? Icons.check, color: Colors.green);
  Widget get _space => SFUIHelper.verticalSpace(height: 10);
}
