import 'package:backoffice_cowork/models/model_place.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/place_admin/place_details.dart';
import '../utils/constants.dart';

DataRow placesDataRow(Place place, BuildContext context) {
  return DataRow(
    onLongPress: () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: PlaceDetails(
            place: place,
          ),
        ),
      );
    },
    cells: [
      DataCell(
        Text(place.id),
      ),
      DataCell(
        Text(place.name),
      ),
      DataCell(
        Text(place.city),
      ),
      DataCell(
        Text("${place.cp}"),
      ),
      const DataCell(
        Icon(
          Icons.info_outline,
          color: primaryColor,
        ),
      ),
    ],
  );
}
