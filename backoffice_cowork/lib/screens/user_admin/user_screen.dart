import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'components/user_content.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SideMenu(select: 2),
            Expanded(
              flex: 7,
              child: UserContent(),
            ),
          ],
        ),
      ),
    );
  }
}
