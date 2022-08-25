import 'package:edstest/models/post.dart';
import 'package:edstest/widgets/back_icon_button.dart';
import 'package:edstest/widgets/post_preview.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;

  Future onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackIconButton(),
          title: const Text('All posts'),
        ),
        body: RefreshIndicator(
            edgeOffset: 10.0,
            displacement: 10,
            onRefresh: onRefresh,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: posts.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return PostPreview(
                  post: posts[index],
                  marginBottom: 12,
                );
              },
            )));
  }
}
