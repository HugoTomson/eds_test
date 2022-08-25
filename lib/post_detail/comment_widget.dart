import 'package:edstest/models/comment.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comment.name,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          comment.body,
          style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(
          height: 4,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            comment.email,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style:
                const TextStyle(fontWeight: FontWeight.w600, color: Colors.blueGrey, fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 5,
            bottom: 18,
          ),
          height: .2,
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
