import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;

   const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor= const Color(0xFFA1BB5A),  this.width, this.borderRadius, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width,
        height: height?? 48,
        margin: const EdgeInsets.symmetric(horizontal: 04),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
