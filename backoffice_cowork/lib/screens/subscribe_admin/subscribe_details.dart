import 'package:backoffice_cowork/models/model_subscribe.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'components/subscribe_details_content.dart';

class SubscribeDetails extends StatefulWidget {
  final Subscribe sub;

  const SubscribeDetails({
    Key? key,
    required this.sub,
  }) : super(key: key);

  @override
  State<SubscribeDetails> createState() => _SubscribeDetailsState();
}

class _SubscribeDetailsState extends State<SubscribeDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SideMenu(select: 5),
            Expanded(
              flex: 7,
              child: SubscribeDetailsContent(subscribe: widget.sub,),
            ),
          ],
        ),
      ),
    );
  }
}
