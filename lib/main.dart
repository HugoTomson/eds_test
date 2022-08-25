import 'package:edstest/user_list_view/user_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test EDS',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const UserListView(title: 'All users'),
    );
  }
}
