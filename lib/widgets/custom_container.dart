import 'package:flutter/material.dart';

import '../utils/export.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? height;
  final double? padding;
  final double? radius;

  const CustomContainer({
    super.key,
     required this.child,
     this.backgroundColor,
     this.height,
     this.padding,
     this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 04),
      padding:EdgeInsets.all(padding??0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius??16),
        border: Border.all(color: AppColors().black),
        boxShadow: [
          BoxShadow(
            color: AppColors().black.withOpacity(0.8),
            offset: const Offset(3, 4),
            spreadRadius: 1,
          )
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
