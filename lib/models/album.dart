import 'dart:convert';

import 'package:edstest/models/photo.dart';

class Album {
  Album({required this.id, required this.title, List<Photo>? photos}) {
    this.photos = photos ?? List.empty();
  }

  int id;
  String title;
  late List<Photo> photos;

  factory Album.fromJson(Map<String, dynamic> parsedJson) {
    final photo = parsedJson['photos'] != null
        ? Photo.fromJson(parsedJson['photos']) as List<dynamic>
        : List.empty();
    return Album(
        id: parsedJson['id'] as int,
        title: parsedJson['title'],
        photos: photo.map((data) => Photo.fromJson(data)).toList());
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "photos": jsonEncode(photos.map((e) => e.toJson()).toList())};
  }
}
