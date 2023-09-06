import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';

class StarRatingRow extends StatelessWidget {
  final String labelText;
  final double progressValue;
  final double width;

  const StarRatingRow({
    Key? key,
    required this.labelText,
    required this.progressValue,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          labelText,
          style: GoogleFonts.syne(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: CustomColors.greySubtitle,
          ),
        ),
        SizedBox(width: width),
        SizedBox(
          width: 70,
          height: 7,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progressValue,
              backgroundColor: CustomColors.greyStar,
              valueColor: const AlwaysStoppedAnimation<Color>(
                CustomColors.mainBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
