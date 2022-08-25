import 'package:carousel_slider/carousel_slider.dart';
import 'package:edstest/models/album.dart';
import 'package:edstest/providers/api_provider.dart';
import 'package:edstest/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';

class AlbumDetailView extends StatefulWidget {
  const AlbumDetailView({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  State<AlbumDetailView> createState() => _AlbumDetailViewState();
}

class _AlbumDetailViewState extends State<AlbumDetailView> {
  late CarouselController controller;
  int index = 0;

  @override
  void initState() {
    controller = CarouselController();
    if (widget.album.photos.isEmpty) {
      getListOfPhotos();
    }
    super.initState();
  }

  Future getListOfPhotos() async {
    await ApiProvider.apiGetPhotosForAlbum(album: widget.album);
    if (mounted) setState(() {});
  }

  Future onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: const BackIconButton(),
          title: const Text('Album view'),
        ),
        body: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      this.index = index;
                      setState(() {});
                    },
                    viewportFraction: .6,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Image.network(
                      widget.album.photos[realIndex].url,
                      fit: BoxFit.contain,
                    );
                  },
                  itemCount: widget.album.photos.length,
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: width,
                    color: Colors.black54,
                    padding: const EdgeInsets.only(bottom: 20, right: 16, left: 16, top: 10),
                    child: Text(
                      widget.album.photos[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white60, fontSize: 16, fontWeight: FontWeight.w500),
                    )))
          ],
        ));
  }
}
