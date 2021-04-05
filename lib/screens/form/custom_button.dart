import 'package:auth_module_flutter/constants/colors.dart';
import 'package:auth_module_flutter/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.color: FaintPinkColor,
    this.child,
    this.textColor: Colors.white,
    this.onPressed,
    this.disabled: false,
    this.label: '',
    this.fontSize: FONT_SMALL,
    this.padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;

  final Color textColor;

  final EdgeInsets padding;

  final String label;
  final bool disabled;
  final double fontSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: disabled ? null : onPressed,
      child: child ??
          Text(
            label,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
    );
  }
}
