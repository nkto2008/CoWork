import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'components/subscribe_content.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({Key? key}) : super(key: key);

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SideMenu(select: 5),
            Expanded(
              flex: 7,
              child: SubscribeContent(),
            ),
          ],
        ),
      ),
    );
  }
}
