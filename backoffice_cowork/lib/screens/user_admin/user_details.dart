import 'package:flutter/material.dart';

import '../../models/model_user.dart';
import '../../widgets/side_menu.dart';
import 'components/user_details_content.dart';

class UserDetails extends StatefulWidget {
  final User user;

  const UserDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SideMenu(select: 2),
            Expanded(
              flex: 7,
              child: UserDetailsContent(user: widget.user,),
            ),
          ],
        ),
      ),
    );
  }
}
