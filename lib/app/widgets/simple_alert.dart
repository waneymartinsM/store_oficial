import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/widgets/custom_animated_button.dart';

void showMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text('ATENÇÃO!', style: GoogleFonts.syne())),
        content: Text(
          message,
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: CustomColors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomAnimatedButton(
              onTap: () {
                Navigator.pop(context);
              },
              widhtMultiply: 1,
              height: 45,
              colorText: Colors.white,
              color: CustomColors.mainBlue,
              text: "OK",
            ),
          ),
        ],
      );
    },
  );
}
