import 'package:edstest/widgets/svg_image_local.dart';
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const SvgImageLocal(
            fit: BoxFit.fitHeight,
            height: 30,
            assetName: './assets/svg/outline-chevron-left.svg',
            color: Colors.white), // Put icon of your preference.
        onPressed: () => Navigator.pop(context));
  }
}
