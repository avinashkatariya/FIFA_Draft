import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label, hint, val;
  final Icon icon;
  final bool obscure;
  final TextEditingController controlleR;
  CustomTextFormField(
      {this.label,
      this.hint,
      this.val,
      this.controlleR,
      this.icon,
      this.obscure = false});

  @override
  State<StatefulWidget> createState() {
    return _CustomTFFState();
  }
}

class _CustomTFFState extends State<CustomTextFormField> {
  String _label, _hint, _val;
  Icon _icon;
  FocusNode _node;
  bool _focused = false;
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = widget.controlleR;
    _label = widget.label;
    _hint = widget.hint;
    _val = widget.val;
    _icon = widget.icon;
    _node = FocusNode(debugLabel: 'Button');
    _node.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      setState(() {
        _focused = _node.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        TextFormField(
          obscureText: widget.obscure,
          controller: myController,
          focusNode: _node,
          autofocus: false,
          onTap: () {
            print(_focused);
            if (_focused) {
              _node.unfocus();
            } else {
              _node.requestFocus();
            }
          },
          onChanged: (text) {
            setState(() {
              _val = text;
            });
          },
          decoration: InputDecoration(
            prefixIcon: _icon,
            labelText: _label,
            labelStyle: TextStyle(fontSize: size.width*0.035)
          
          ),
        )
      ],
    );
  }
}
