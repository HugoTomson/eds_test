class Adress {
  Adress({
    required this.street,
    required this.suite,
    required this.city,
  });

  String street;
  String suite;
  String city;

  factory Adress.fromJson(Map<String, dynamic> parsedJson) {
    return Adress(
      street: parsedJson['street'],
      suite: parsedJson['suite'],
      city: parsedJson['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "suite": suite,
      "city": city,
    };
  }
}
