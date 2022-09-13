import 'package:flutter/material.dart';

import '../../models/model_user.dart';
import '../../widgets/side_menu.dart';
import 'components/new_user_content.dart';
import 'components/user_details_content.dart';

class NewUser extends StatefulWidget {

  const NewUser({
    Key? key,
  }) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
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
              child: NewUserContent(),
            ),
          ],
        ),
      ),
    );
  }
}
