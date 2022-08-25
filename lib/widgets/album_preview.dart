import 'package:edstest/album_detail/album_detail_view.dart';
import 'package:edstest/models/album.dart';
import 'package:edstest/providers/api_provider.dart';
import 'package:flutter/material.dart';

class AlbumPreview extends StatefulWidget {
  const AlbumPreview({
    Key? key,
    required this.album,
    required this.size,
    this.marginLeft = 0,
  }) : super(key: key);

  final Album album;
  final double size;
  final double marginLeft;

  @override
  State<AlbumPreview> createState() => _AlbumPreviewState();
}

class _AlbumPreviewState extends State<AlbumPreview> {
  @override
  void initState() {
    getListOfPhotos();
    super.initState();
  }

  Future getListOfPhotos() async {
    await ApiProvider.apiGetPhotosForAlbum(album: widget.album);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: widget.marginLeft),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: widget.album.photos.isNotEmpty
            ? InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return AlbumDetailView(
                        album: widget.album,
                      );
                    })),
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                    width: widget.size,
                    height: widget.size,
                    child: Image.network(
                      widget.album.photos[0].thumbnailUrl,
                      fit: BoxFit.none,
                    )))
            : Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                width: widget.size,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ));
  }
}
