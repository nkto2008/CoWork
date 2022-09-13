import 'package:backoffice_cowork/screens/home_admin/components/home_content.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SideMenu(select: 1),
            Expanded(
              flex: 7,
              child: HomeContent(),
            ),
          ],
        ),
      ),
    );
  }
}
