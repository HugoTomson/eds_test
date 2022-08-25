import 'dart:convert';

import 'package:edstest/models/comment.dart';
import 'package:edstest/models/post.dart';
import 'package:edstest/post_detail/comment_widget.dart';
import 'package:edstest/providers/api_provider.dart';
import 'package:edstest/providers/cache_provider.dart';
import 'package:edstest/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  late List<Comment> comments;
  late TextEditingController controllerName;
  late TextEditingController controllerMail;
  late TextEditingController controllerText;

  bool checkTextVisible = false;
  bool checkMailVisible = false;
  bool checkNameVisible = false;

  @override
  void initState() {
    comments = List.empty();
    getListOfComments();
    controllerName = TextEditingController();
    controllerMail = TextEditingController();
    controllerText = TextEditingController();
    super.initState();
  }

  Future getListOfComments() async {
    comments = await ApiProvider.apiGetCommentsForPost(id: widget.post.id);
    if (mounted) setState(() {});
  }

  Future onRefresh() async {}

  Future<void> _displayTextInputDialog(BuildContext context) async {
    checkTextVisible = false;
    checkMailVisible = false;
    checkNameVisible = false;
    controllerName.text = '';
    controllerMail.text = '';
    controllerText.text = '';
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return AlertDialog(
                content: SizedBox(
                    width: 300,
                    height: 285,
                    child: Column(children: [
                      TextField(
                        onChanged: (value) {},
                        controller: controllerMail,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            borderSide:
                                BorderSide(color: Colors.blueGrey.withOpacity(.5), width: .5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.blueGrey, width: .5),
                          ),
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 300,
                          padding: const EdgeInsets.only(left: 13, top: 2),
                          child: checkMailVisible
                              ? const Text(
                                  'Check email',
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                )
                              : null),
                      TextField(
                        onChanged: (value) {},
                        controller: controllerName,
                        decoration: InputDecoration(
                          hintText: "Name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            borderSide:
                                BorderSide(color: Colors.blueGrey.withOpacity(.5), width: .5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                          ),
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 300,
                          padding: const EdgeInsets.only(left: 13, top: 2),
                          child: checkNameVisible
                              ? const Text(
                                  'Check name',
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                )
                              : null),
                      TextField(
                        onChanged: (value) {},
                        controller: controllerText,
                        decoration: InputDecoration(
                          hintText: "Text",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            borderSide:
                                BorderSide(color: Colors.blueGrey.withOpacity(.5), width: .5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.blueGrey, width: .5),
                          ),
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 300,
                          padding: const EdgeInsets.only(left: 13, top: 2),
                          child: checkTextVisible
                              ? const Text(
                                  'Check text',
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                )
                              : null),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                        ),
                        onPressed: () {
                          checkMailVisible = false;
                          checkNameVisible = false;
                          checkTextVisible = false;
                          if (controllerMail.text.isEmpty &&
                              !controllerMail.text.contains(RegExp('^\\S+@\\S+\\.\\S+\$'))) {
                            checkMailVisible = true;
                          }
                          if (controllerName.text.isEmpty) {
                            checkNameVisible = true;
                          }
                          if (controllerText.text.isEmpty) {
                            checkTextVisible = true;
                          }
                          if (!checkMailVisible && !checkNameVisible && !checkTextVisible) {
                            ApiProvider.apiSendComment(widget.post.id, controllerText.text,
                                controllerName.text, controllerMail.text);

                            comments.add(Comment(
                                id: 1,
                                body: controllerText.text,
                                name: controllerName.text,
                                email: controllerMail.text));
                            CacheProvider.saveObjectJson(
                                key: '${CacheProvider.comments}${widget.post.id}',
                                objectJson: jsonEncode(comments.map((e) => e.toJson()).toList()));
                            this.setState(() {});
                            Navigator.pop(context);
                          }
                          setState.call(() {});
                        },
                        child: const Text(
                          'Send comment',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ])));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackIconButton(),
          title: const Text('All comments'),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.post.body,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 16,
                      ),
                      height: 16,
                      color: Colors.blueGrey.withOpacity(.2),
                    ),
                    Expanded(
                        child: RefreshIndicator(
                            edgeOffset: 10.0,
                            displacement: 10,
                            onRefresh: onRefresh,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: comments.length,
                              padding: const EdgeInsets.only(bottom: 50, top: 16),
                              itemBuilder: (BuildContext context, int index) {
                                return CommentWidget(
                                  comment: comments[index],
                                );
                              },
                            )))
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                    ),
                    onPressed: () {
                      _displayTextInputDialog(context);
                    },
                    child: const Text(
                      'Add comment',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            )));
  }
}
