import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final Icon? icon;
  final bool password;  final String? Function(String?)? validator;

  final bool autofocus;
  final bool readOnly;
  final Function? onTapPassword;
  final Function? onChange;
  final Function? onTap;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.icon,
    required this.textInputType,
    this.controller,
    this.autofocus = false,
    this.password = false,
    this.readOnly = false,
    this.obscureText = false,
    this.onTapPassword,
    this.onTap,
    this.onChange,
    this.inputFormatters,
    this.labelText,
    this.contentPadding,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: CustomColors.jet.withOpacity(0.7)),
      textAlign: TextAlign.start,
      cursorColor: CustomColors.mainGolden,
      onChanged: (String text) {
        if (onChange != null) {
          onChange!(text);
        }
      },
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      readOnly: readOnly,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.syne()
            .copyWith(color: CustomColors.jet.withOpacity(0.7)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: CustomColors.grey),
        filled: true,
        fillColor: CustomColors.lightGrey,
        alignLabelWithHint: true,
        prefixIconConstraints:
            icon != null ? BoxConstraints.tight(const Size(48, 24)) : null,
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: icon,
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(15, 18, 15, 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
          borderSide: BorderSide(
            width: 1.18,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.transparent,
          ), //Color(0xff1a1919)
        ),
      ),
    );
  }
}
