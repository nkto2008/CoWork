import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/side_menu.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SideMenu(select: 4),
            Expanded(
              flex: 7,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
