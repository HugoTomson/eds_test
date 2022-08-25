import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    Key? key,
    required this.title,
    required this.desc,
    this.descIsItalic = false,
    this.bottomMargin = 0,
  }) : super(key: key);

  final bool descIsItalic;
  final String title;
  final String desc;
  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: bottomMargin, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            SizedBox(
              width: 100,
              child: (Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 14),
              )),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12, top: 4),
              height: 16,
              width: .2,
              color: Colors.blueGrey,
            ),
            Expanded(
              child: Text(desc,
                  style: TextStyle(
                      fontStyle: descIsItalic ? FontStyle.italic : null,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16)),
            ),
          ],
        ));
  }
}
