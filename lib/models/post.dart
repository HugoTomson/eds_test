class Post {
  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  int id;
  String title;
  String body;

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
      id: parsedJson['id'] as int,
      title: parsedJson['title'],
      body: parsedJson['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
