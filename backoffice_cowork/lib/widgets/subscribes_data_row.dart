import 'package:backoffice_cowork/models/model_subscribe.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/subscribe_admin/subscribe_details.dart';
import '../utils/constants.dart';

DataRow subscribesDataRow(Subscribe sub, BuildContext context) {
  return DataRow(
    onLongPress: () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: SubscribeDetails(
            sub: sub,
          ),
        ),
      );
    },
    cells: [
      DataCell(
        Text(sub.id),
      ),
      DataCell(
        Text(sub.name),
      ),
      DataCell(
        Text("${sub.price}"),
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
