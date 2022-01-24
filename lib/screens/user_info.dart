import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserListTile('Email', 'Email sub', 0, (){}),
          UserListTile('Phone', '4555', 1, (){}),
          UserListTile('Shipping Address', 'Email sub', 2, (){}),
          UserListTile('Joined date', 'Email sub', 3, (){}),
        ]
      )
    );
  }
}

List<IconData> _userTileIcons = [
  Icons.email,
  Icons.phone,
  Icons.local_shipping,
  Icons.watch_later,
  Icons.exit_to_app_rounded
];

class UserListTile extends StatelessWidget {
  
  String title;
  String subtitle;
  int index;
  Function()? onTap;

  UserListTile(this.title, this.subtitle, this.index, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).splashColor,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }
}