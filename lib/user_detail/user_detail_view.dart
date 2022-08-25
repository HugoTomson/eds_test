import 'package:edstest/album_list_view/album_list_view.dart';
import 'package:edstest/models/album.dart';
import 'package:edstest/models/post.dart';
import 'package:edstest/models/user.dart';
import 'package:edstest/post_list_view/post_list_view.dart';
import 'package:edstest/providers/api_provider.dart';
import 'package:edstest/user_detail/detail_row.dart';
import 'package:edstest/widgets/album_preview.dart';
import 'package:edstest/widgets/back_icon_button.dart';
import 'package:edstest/widgets/divider_text.dart';
import 'package:edstest/widgets/post_preview.dart';
import 'package:flutter/material.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key, required this.userForDetail}) : super(key: key);

  final User userForDetail;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  late List<Post> posts;
  late List<Album> albums;

  @override
  void initState() {
    posts = List.empty();
    albums = List.empty();
    getListOfPosts();
    getAlbumsForUser();
    super.initState();
  }

  Future getListOfPosts() async {
    posts = await ApiProvider.apiGetPostsForUser(id: widget.userForDetail.id);
    if (mounted) setState(() {});
  }

  Future getAlbumsForUser() async {
    albums = await ApiProvider.apiGetAlbumsForUser(id: widget.userForDetail.id);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackIconButton(),
        title: Text(widget.userForDetail.username),
      ),
      body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 8,
        ),
        const DividerText(
          title: 'User Information',
        ),
        DetailRow(
          title: 'Name',
          desc: widget.userForDetail.name,
          bottomMargin: 4,
        ),
        DetailRow(title: 'E-mail', desc: widget.userForDetail.email, bottomMargin: 4),
        DetailRow(title: 'Phone', desc: widget.userForDetail.phone, bottomMargin: 4),
        DetailRow(title: 'Website', desc: widget.userForDetail.website),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 2, left: 16, right: 16),
          height: .2,
          color: Colors.blueGrey,
        ),
        const DividerText(
          title: 'Working',
        ),
        DetailRow(title: 'Name', desc: widget.userForDetail.company.name, bottomMargin: 4),
        DetailRow(title: 'Bs', desc: widget.userForDetail.company.bs, bottomMargin: 4),
        DetailRow(
          title: 'CatchPhrase',
          desc: '"${widget.userForDetail.company.catchPhrase}"',
          descIsItalic: true,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 8, left: 16, right: 16),
          height: .2,
          color: Colors.blueGrey,
        ),
        DetailRow(
            title: 'Adress',
            desc:
                '${widget.userForDetail.address.city}, ${widget.userForDetail.address.street}, ${widget.userForDetail.address.suite}'),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 6, left: 16, right: 16),
          height: 16,
          color: Colors.blueGrey.withOpacity(.2),
        ),
        DividerText(
          title: 'Posts',
          showMoreFunction: () {
            if (posts.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PostListView(
                  posts: posts,
                );
              }));
            }
          },
        ),
        Container(
            margin: const EdgeInsets.only(top: 6),
            height: 64,
            child: ListView.builder(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: posts.length < 3 ? posts.length : 3,
              itemBuilder: (BuildContext context, int index) {
                return PostPreview(
                  post: posts[index],
                  marginLeft: index != 0 ? 10 : 0,
                );
              },
            )),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 6, left: 16, right: 16),
          height: 16,
          color: Colors.blueGrey.withOpacity(.2),
        ),
        DividerText(
          title: 'Albums',
          showMoreFunction: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AlbumListView(
              albums: albums,
            );
          })),
        ),
        Container(
            margin: const EdgeInsets.only(
              top: 6,
            ),
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: albums.length < 3 ? albums.length : 3,
              itemBuilder: (BuildContext context, int index) {
                return AlbumPreview(
                  size: width / 2 - 24,
                  album: albums[index],
                  marginLeft: index != 0 ? 16 : 0,
                );
              },
            )),
        const SizedBox(
          height: 12,
        ),
      ])),
    );
  }
}
