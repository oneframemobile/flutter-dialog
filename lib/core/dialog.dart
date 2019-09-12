import 'package:flutter/material.dart';

import 'child/error.dart';
import 'child/info.dart';
import 'child/inputs.dart';
import 'child/loading.dart';
import 'child/succes.dart';
import 'helper/ui_helper.dart';

class StarforceDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StarforceDialogState();
  final String description;
  final String title;
  final List<Widget> buttons;
  final DialogType type;
  final List<TextField> fields;
  final Icon icon;
  final SFDialogTheme theme;
  final Function onClose;
  final int maxDescLines;
  final int maxTitleLines;

  StarforceDialog({
    Key key,
    @required this.title,
    @required this.type,
    this.fields,
    this.description,
    this.buttons,
    this.icon,
    this.theme = SFDialogTheme.medium,
    this.onClose,
    this.maxDescLines,
    this.maxTitleLines,
  }) : super(key: key);
}

class StarforceDialogState extends State<StarforceDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    controllerInit();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SFUIHelper.padding),
      ),
      backgroundColor: Colors.transparent,
      child: _dialogContent,
    );
  }

  Widget get _dialogContent {
    return BackdropFilter(
      filter: SFUIHelper.backgroundFilter,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(SFUIHelper.padding),
          decoration: SFUIHelper.dialogBoxDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[_dialogCloseButton, _dialog],
          ),
        ),
      ),
    );
  }

  Widget get _dialog {
    switch (widget.type) {
      case DialogType.info:
        return InfoDialog(
            title: widget.title,
            description: widget.description,
            buttons: widget.buttons,
            theme: widget.theme,
            maxDescLines: widget.maxDescLines,
            maxTitleLines: widget.maxTitleLines,
            icon: widget.icon);
      case DialogType.success:
        return SuccessDialog(
            title: widget.title,
            description: widget.description,
            maxDescLines: widget.maxDescLines,
            maxTitleLines: widget.maxTitleLines,
            icon: widget.icon);
      case DialogType.loading:
        return LoadingDialog(
            title: widget.title,
            description: widget.description,
            maxDescLines: widget.maxDescLines,
            maxTitleLines: widget.maxTitleLines,
            icon: widget.icon);
      case DialogType.error:
        return ErrorDialog(
            title: widget.title,
            description: widget.description,
            maxDescLines: widget.maxDescLines,
            maxTitleLines: widget.maxTitleLines,
            icon: widget.icon);
        break;
      case DialogType.inputs:
        return InputsDialog(
            inputs: widget.fields,
            title: widget.title,
            description: widget.description,
            maxDescLines: widget.maxDescLines,
            maxTitleLines: widget.maxTitleLines,
            icon: widget.icon);
        break;
      default:
        return InfoDialog(
            title: widget.title,
            description: widget.description,
            maxDescLines: widget.maxDescLines,
            maxTitleLines: widget.maxTitleLines,
            icon: widget.icon);
    }
  }

  Widget get _dialogCloseButton {
    return widget.type == DialogType.loading
        ? SFUIHelper.verticalSpace()
        : Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onClose();
              },
              icon: Icon(Icons.close),
            ),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void controllerInit() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _controller.forward(from: 0.5);
  }
}
