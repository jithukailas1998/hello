import 'package:flutter/material.dart';
import 'package:hello/models/model.dart';

class UserItems extends StatelessWidget {
  final UserModel user;

  const UserItems(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(user.id.toString()),
        ),
        title: Text(user.title),
        
      ),
    );
  }
}
