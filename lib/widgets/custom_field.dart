import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomField extends StatelessWidget {
  final String titleText;
  final String hint;
  final double iconPaddingRight;
  final Icon iconRight;
  final Color? titleColor;
  final double titleFontSize;
  final FontWeight? titleFontWeight;

  CustomField({
    required this.titleText,
    required this.hint,
    required this.iconPaddingRight,
    required this.iconRight,
    required this.titleColor,
    required this.titleFontSize,
    required this.titleFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: GoogleFonts.raleway(
            color: titleColor ?? AppColors().greyColor,
            fontSize: titleFontSize,
            fontWeight: titleFontWeight ?? FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        Stack(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: hint,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey), // Grey color for the underline
                ),
              ),
            ),
            Positioned(
              right: iconPaddingRight,
              child: iconRight,
            ),
          ],
        ),
      ],
    );
  }
}



