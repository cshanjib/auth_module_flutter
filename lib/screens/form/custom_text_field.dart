import 'package:auth_module_flutter/constants/colors.dart';
import 'package:auth_module_flutter/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key,
      this.focusNode,
      this.onTap,
      this.label,
      this.onSubmitted,
      this.onChanged,
      this.controller,
      this.enabled: true,
      this.placeholder,
      this.keyboardType,
      this.suffixIcon,
      this.obscureText: false,
      this.readOnly: false,
      this.max: 999999,
      this.filled: false,
      this.prefixIcon,
      this.errorMaxLines: 1,
      this.maxLines: 1,
      this.focusedColor: PrimaryBlueColor,
      this.errorText: '',
      this.valid: true,
      this.inputFormatters})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final String placeholder;
  final String errorText;
  final String label;
  final bool filled;
  final int errorMaxLines;
  final int maxLines;
  final IconButton prefixIcon;
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;
  final bool enabled;
  final bool valid;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconButton suffixIcon;
  final VoidCallback onTap;
  final Color focusedColor;
  final int max;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: TextInputAction.go,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
          errorText: valid ? null : errorText,
          errorMaxLines: errorMaxLines,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: GAP_SMALL),
            child: suffixIcon,
          ),
          prefixIcon: prefixIcon,
          filled: filled,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(
                const Radius.circular(30.0),
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(
                const Radius.circular(30.0),
              )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: LightGrey),
              borderRadius: BorderRadius.all(
                const Radius.circular(30.0),
              )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedColor),
              borderRadius: BorderRadius.all(
                const Radius.circular(30.0),
              )),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: LightGrey),
              borderRadius: BorderRadius.all(
                const Radius.circular(30.0),
              )),
          counter: SizedBox.shrink(),
          hintText: placeholder,
//            labelText: this.label,
          isDense: true,
          hintStyle: TextStyle(color: LightGrey, fontSize: FONT_NORMAL),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      maxLength: max,
      readOnly: readOnly,
      autocorrect: false,
      onTap: onTap,
    );
  }
}
