class Comment {
  Comment({
    required this.id,
    required this.name,
    required this.body,
    required this.email,
  });

  int id;
  String name;
  String body;
  String email;

  factory Comment.fromJson(Map<String, dynamic> parsedJson) {
    return Comment(
      id: parsedJson['id'] as int,
      name: parsedJson['name'] ?? '',
      body: parsedJson['body'] ?? '',
      email: parsedJson['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "body": body,
      "email": email,
    };
  }
}
