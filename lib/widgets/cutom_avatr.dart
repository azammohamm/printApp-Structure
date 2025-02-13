import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String? flagUrl;
  final bool isSvg;

  const CustomAvatar({
    Key? key,
    required this.imageUrl,
    this.size = 50.0,
    this.flagUrl,
    this.isSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,  // Placeholder color
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(imageUrl, fit: BoxFit.cover),
          ),
          if (flagUrl != null)
            Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(flagUrl!, width: 15, height: 15), // Smaller flag icon
            ),
        ],
      ),
    );
  }
}
