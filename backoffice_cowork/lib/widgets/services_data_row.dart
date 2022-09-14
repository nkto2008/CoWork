import 'package:backoffice_cowork/models/model_service.dart';
import 'package:backoffice_cowork/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/service_admin/service_details.dart';

DataRow servicesDataRow(Service serv, BuildContext context) {
  return DataRow(
    onLongPress: () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: ServiceDetails(
            service: serv,
          ),
        ),
      );
    },
    cells: [
      DataCell(
        Text(serv.id),
      ),
      DataCell(
        Text(serv.name),
      ),
      DataCell(
        Text("${serv.price}"),
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
