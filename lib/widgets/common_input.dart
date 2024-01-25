import 'package:flutter/material.dart';

class CommonTextFeil extends StatelessWidget {
  const CommonTextFeil({
    super.key,
    required this.hinttext,
    required this.label,
    this.suffixicon,
    this.validation = false,
    this.controller,
    this.fillColor,
    this.maxLength,
    this.textInputType,
    this.suffixIcon,
    this.onChanged,
    this.labelColor,
    this.hinttextColor,
    this.mobileNoValidater = false,
    this.emailValidation = false,
  });
  final String hinttext;
  final String label;
  final Widget? suffixicon;
  final bool? validation;
  final Color? fillColor;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Color? labelColor;
  final Color? hinttextColor;
  final bool mobileNoValidater;
  final bool emailValidation;
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
        suffix: suffixicon,
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
