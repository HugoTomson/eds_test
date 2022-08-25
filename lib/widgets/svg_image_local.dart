import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageLocal extends StatelessWidget {
  const SvgImageLocal({
    Key? key,
    required this.assetName,
    this.color,
    this.semanticsLabel,
    this.width,
    this.height,
    this.alignment,
    this.clipBehavior,
    this.fit,
  }) : super(key: key);

  final String assetName; // example: './assets/svg/facebook.svg'
  final Color? color;
  final String? semanticsLabel;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final Clip? clipBehavior;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName,
        color: color,
        alignment: alignment ?? Alignment.center,
        clipBehavior: clipBehavior ?? Clip.none,
        width: width ?? 24.0,
        height: height ?? 24.0,
        fit: fit ?? BoxFit.none,
        semanticsLabel: semanticsLabel ?? '');
  }
}

class SvgImageNetwork extends StatelessWidget {
  const SvgImageNetwork({
    Key? key,
    required this.path,
    this.color,
    this.semanticsLabel,
    this.width,
    this.height,
    this.alignment,
    this.clipBehavior,
    this.fit,
  }) : super(key: key);

  final String path; // example: 'https://site-that-takes-a-while.com/image.svg'
  final String? semanticsLabel;
  final Color? color;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final Clip? clipBehavior;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(path,
        color: color ?? Colors.black,
        alignment: alignment ?? Alignment.center,
        clipBehavior: clipBehavior ?? Clip.none,
        width: width ?? 22.0,
        height: height ?? 22.0,
        fit: fit ?? BoxFit.none,
        semanticsLabel: semanticsLabel ?? '');
  }
}
