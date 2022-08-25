import 'package:edstest/widgets/svg_image_local.dart';
import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({Key? key, required this.title, this.margin = 16, this.showMoreFunction})
      : super(key: key);

  final String title;
  final double margin;
  final Function()? showMoreFunction;

  @override
  Widget build(BuildContext context) {
    final child = Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
            ),
            if (showMoreFunction != null)
              const SvgImageLocal(
                  fit: BoxFit.fitHeight,
                  assetName: './assets/svg/outline-chevron.svg',
                  color: Colors.blueGrey)
          ],
        ));
    return showMoreFunction != null
        ? InkWell(onTap: () => showMoreFunction?.call(), child: child)
        : child;
  }
}
