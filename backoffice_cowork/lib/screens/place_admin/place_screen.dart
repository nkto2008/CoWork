import 'package:backoffice_cowork/screens/place_admin/components/place_content.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/side_menu.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SideMenu(select: 3),
            Expanded(
              flex: 7,
              child: PlaceContent(),
            ),
          ],
        ),
      ),
    );
  }
}
