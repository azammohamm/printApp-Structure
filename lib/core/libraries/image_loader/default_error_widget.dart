import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String _noImageFound = 'assets/images/noImageFound.svg';

class DefaultErrorWidget extends StatelessWidget {
  final Color? color;
  final BlendMode blendMode;
  final BoxFit boxFit;
  final Alignment alignment;
  final String? semanticLabel;
  final bool matchTextDirection;
  final bool excludeFromSemantics;
  final double? height, width;

  const DefaultErrorWidget(
      {super.key,
      this.alignment = Alignment.center,
      this.boxFit = BoxFit.contain,
      this.blendMode = BlendMode.src,
      this.semanticLabel,
      this.matchTextDirection = false,
      this.excludeFromSemantics = false,
      this.width,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) => _defaultErrorBuilder;

  Widget get _defaultErrorBuilder => Center(
        child: SvgPicture.asset(
          _noImageFound,
          height: _imageNotFoundHeight,
          width: _imageNotFoundWidth,
          colorFilter: color == null ? null: ColorFilter.mode(color!, blendMode),
          fit: boxFit,
          alignment: alignment,
          excludeFromSemantics: excludeFromSemantics,
          matchTextDirection: matchTextDirection,
          semanticsLabel: semanticLabel,
        ),
      );

  double get _imageNotFoundHeight => height != null ? height! / 2 : 30.0;

  double get _imageNotFoundWidth => width != null ? width! / 2 : 30.0;
}
