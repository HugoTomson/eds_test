import 'package:edstest/models/user.dart';
import 'package:edstest/providers/api_provider.dart';
import 'package:edstest/user_list_view/user_list_item.dart';
import 'package:flutter/material.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late List<User> users;

  @override
  void initState() {
    users = List.empty();
    getListOfUsers();
    super.initState();
  }

  Future onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: RefreshIndicator(
            edgeOffset: 10.0,
            displacement: 10,
            onRefresh: onRefresh,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: users.length,
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              itemBuilder: (BuildContext context, int index) {
                return UserListItem(user: users[index]);
              },
            )));
  }

  Future getListOfUsers() async {
    users = await ApiProvider.apiGetListOfUsers();
    if (mounted) setState(() {});
  }
}
