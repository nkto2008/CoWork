import 'package:flutter/material.dart';

import '../../models/model_place.dart';
import '../../widgets/side_menu.dart';
import 'components/place_details_content.dart';

class PlaceDetails extends StatefulWidget {
  final Place place;

  const PlaceDetails({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SideMenu(select: 3),
            Expanded(
              flex: 7,
              child: PlaceDetailsContent(place: widget.place),
            ),
          ],
        ),
      ),
    );
  }
}
