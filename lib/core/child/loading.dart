import 'package:flutter/material.dart';
import '../helper/ui_helper.dart';

class LoadingDialog extends StatelessWidget {
  LoadingDialog({
    Key key,
    @required this.title,
    this.description,
    this.maxDescLines,
    this.icon,
  }) : super(key: key);
  final String title;
  final String description;
  final Icon icon;
  final int maxDescLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _loading,
        _title,
        _space,
        _description,
      ],
    );
  }

  Widget get _title => Text(
        this.title,
        style: SFUIHelper.titleTextStyle,
      );

  Widget get _description => Text(
        this.description ?? "",
        textAlign: TextAlign.center,
        maxLines: maxDescLines,
        style: SFUIHelper.descriptionTextStyle,
      );

  Widget get _loading => CircularProgressIndicator();
  Widget get _space => SFUIHelper.verticalSpace(height: 10);
}
