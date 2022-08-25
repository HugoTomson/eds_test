import 'package:edstest/models/user.dart';
import 'package:edstest/user_detail/user_detail_view.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserDetailView(
                    userForDetail: user,
                  );
                })),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    user.username,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    user.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ]))));
  }
}
