class Photo {
  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory Photo.fromJson(Map<String, dynamic> parsedJson) {
    return Photo(
      id: parsedJson['id'] as int,
      title: parsedJson['title'],
      url: parsedJson['url'],
      thumbnailUrl: parsedJson['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "url": url,
      "thumbnailUrl": thumbnailUrl,
    };
  }
}
