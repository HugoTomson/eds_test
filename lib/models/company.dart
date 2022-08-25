class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> parsedJson) {
    return Company(
      name: parsedJson['name'],
      catchPhrase: parsedJson['catchPhrase'],
      bs: parsedJson['bs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "catchPhrase": catchPhrase,
      "bs": bs,
    };
  }
}
