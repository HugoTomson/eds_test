import 'package:edstest/models/album.dart';
import 'package:edstest/widgets/album_preview.dart';
import 'package:edstest/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';

class AlbumListView extends StatelessWidget {
  const AlbumListView({Key? key, required this.albums}) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackIconButton(),
        title: const Text('All albums'),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        ),
        clipBehavior: Clip.none,
        itemCount: albums.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        itemBuilder: (BuildContext context, int index) {
          return AlbumPreview(
            album: albums[index],
            size: width / 2 - 24,
          );
        },
      ),
    );
  }
}
