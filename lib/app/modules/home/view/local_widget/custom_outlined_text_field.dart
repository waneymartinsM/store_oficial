import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;

  const CustomOutlinedTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.cursorColor,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: CustomColors.mainBlue, width: 2),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16.0),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: cursorColor,
        style: const TextStyle(
            color: CustomColors.black, fontWeight: FontWeight.w500),
        inputFormatters: inputFormatters,
      ),
    );
  }
}
