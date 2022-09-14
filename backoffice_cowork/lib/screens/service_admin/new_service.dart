import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'components/new_service_content.dart';

class NewService extends StatefulWidget {

  const NewService({
    Key? key,
  }) : super(key: key);

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SideMenu(select: 4),
            Expanded(
              flex: 7,
              child: NewServiceContent(),
            ),
          ],
        ),
      ),
    );
  }
}
