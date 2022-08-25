import 'package:edstest/models/post.dart';
import 'package:edstest/post_detail/post_detail_view.dart';
import 'package:flutter/material.dart';

class PostPreview extends StatelessWidget {
  const PostPreview({
    Key? key,
    required this.post,
    this.marginLeft = 0,
    this.marginBottom = 0,
    this.width = 240,
  }) : super(key: key);

  final Post post;
  final double marginLeft;
  final double marginBottom;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: EdgeInsets.only(left: marginLeft, bottom: marginBottom),
        child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PostDetailView(
                    post: post,
                  );
                })),
            child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      post.body,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14),
                    ),
                  ],
                ))));
  }
}
