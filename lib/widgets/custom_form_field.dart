import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String? hint;
  final String? titleText;
  final Color? titleColor;
  final double titleFontSize;
  final FontWeight? titleFontWeight;
  final double? height;
  final Color? fieldColor;
  final Color? suffixIcon;
  final double fontSize;
  final double contentPadding;
  final double? iconSize;
  final double? iconPaddingRight;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? tec;
  final bool? isSelected;
  final bool? showPassword;
  final bool? obscureText;
  final bool showTitle;
  final bool? readOnly;
  final void Function()? onPressed;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? lines;
  final Color? borderColor;
  final Widget? prefixIcon;
  final double borderRadius;

  const CustomFormField({
    super.key,
    this.hint = "",
    this.titleText,
    this.titleFontSize = 14,
    this.fontSize = 14,
    this.contentPadding = 14,
    this.titleFontWeight,
    this.titleColor,
    this.iconPaddingRight,
    this.maxLength,
    this.iconSize,
    this.showPassword,
    this.obscureText,
    this.showTitle = true,
    this.height,
    this.fieldColor,
    this.keyboardType,
    this.tec,
    this.readOnly,
    this.onPressed,
    this.isSelected,
    this.inputFormatters,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
    this.lines,
    this.borderColor,
    this.prefixIcon,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(
                        titleText ?? "",
                        style: GoogleFonts.montserrat(
                          color: titleColor ?? AppColors().greyColor,
                          fontSize: titleFontSize,
                          fontWeight: titleFontWeight ?? FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: tec,
          showCursor: readOnly == true ? false : true,
          inputFormatters: inputFormatters,
          autocorrect: false,
          maxLength: maxLength,
          obscureText: obscureText ?? false,
          maxLines: lines ?? 1,
          readOnly: readOnly ?? false,
          cursorColor: AppColors().greenColor,
          style: GoogleFonts.montserrat(
            color: AppColors().black,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: contentPadding, vertical: contentPadding),
            isDense: true,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors().greyColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors().greyColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors().greyColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.montserrat(
              color: AppColors().greyColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
            errorStyle: GoogleFonts.montserrat(
              color: Colors.red,
              fontSize: fontSize - 3,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: showPassword == true
                ? IconButton(
                    highlightColor: Colors.transparent,
                    padding: EdgeInsets.only(right: iconPaddingRight ?? 10),
                    icon: Icon(
                      obscureText == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                      size: iconSize,
                    ),
                    onPressed: onPressed,
                  )
                : null,
            prefixIcon: prefixIcon,
          ),
          validator: validator,
        )
      ],
    );
  }
}
