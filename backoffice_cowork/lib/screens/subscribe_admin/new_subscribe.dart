import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'components/new_subscribe_content.dart';

class NewSubscribe extends StatefulWidget {

  const NewSubscribe({
    Key? key,
  }) : super(key: key);

  @override
  State<NewSubscribe> createState() => _NewSubscribeState();
}

class _NewSubscribeState extends State<NewSubscribe> {
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
              child: NewSubscribeContent(),
            ),
          ],
        ),
      ),
    );
  }
}
