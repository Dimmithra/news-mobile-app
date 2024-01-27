import 'package:flutter/material.dart';

class CommonTextFeil extends StatelessWidget {
  const CommonTextFeil({
    super.key,
    required this.hinttext,
    required this.label,
    this.controller,
    this.fillColor,
    this.maxLength,
    this.textInputType,
    this.suffixIcon,
    this.onChanged,
    this.labelColor,
    this.hinttextColor,
  });
  final String hinttext;
  final String label;
  final Color? fillColor;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Color? labelColor;
  final Color? hinttextColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          color: hinttextColor,
        ),
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: labelColor,
          ),
        ),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: suffixIcon,
      ),
      controller: controller,
    );
  }
}
