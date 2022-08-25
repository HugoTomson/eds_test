import 'package:edstest/models/adress.dart';
import 'package:edstest/models/company.dart';

class User {
  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.company,
      required this.address,
      required this.email,
      required this.phone,
      required this.website});

  int id;
  String username;
  String name;
  Adress address;
  String email;
  String phone;
  String website;
  Company company;

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'] as int,
      username: parsedJson['username'],
      name: parsedJson['name'],
      address: Adress.fromJson(parsedJson['address'] as Map<String, dynamic>),
      email: parsedJson['email'],
      phone: parsedJson['phone'],
      website: parsedJson['website'],
      company: Company.fromJson(parsedJson['company'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "address": address.toJson().toString(),
      "email": email,
      "phone": phone,
      "website": website,
      "company": company.toJson().toString(),
    };
  }
}
