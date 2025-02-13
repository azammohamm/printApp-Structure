import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/export.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final Color? inputBorderColor;
  final TextEditingController controller;
  final double? textSize;
  final double? inputHeight;
  final double? iconSize;
  final double? inputWidth;
  final Function(String)? onChanged;

  const SearchField({
    Key? key,
    required this.hint,
    this.inputBorderColor,
    this.textSize,
    this.inputHeight,
    this.iconSize,
    this.onChanged,
    this.inputWidth,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: inputHeight ?? 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors().white,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: AppColors().greyLightColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: AppColors().greyColor,
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.only(
              bottom: 10.0,
              right: 10.0,
              left: 10.0,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.montserrat(
              color: AppColors().greyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 24,
              color: AppColors().greyColor,
            ),
          ),
          onChanged: onChanged,
          cursorColor: AppColors().accentColor,
          style: GoogleFonts.montserrat(
            color: AppColors().fontColor,
            fontSize: textSize ?? 16,
            fontWeight: FontWeight.w500,
          )
      )

    );
  }

  OutlineInputBorder myInputBorder(Color? color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(
        color:  AppColors().searchColor,
        width: 0.50,
      ),
    );
  }
}
