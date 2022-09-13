import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'components/new_place_content.dart';

class NewPlace extends StatefulWidget {

  const NewPlace({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends State<NewPlace> {
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
              child: NewPlaceContent(),
            ),
          ],
        ),
      ),
    );
  }
}
