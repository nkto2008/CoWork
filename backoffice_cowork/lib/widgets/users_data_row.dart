import 'package:backoffice_cowork/models/model_user.dart';
import 'package:backoffice_cowork/screens/user_admin/user_details.dart';
import 'package:backoffice_cowork/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

DataRow usersDataRow(User user, BuildContext context) {
  return DataRow(
    onLongPress: () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: UserDetails(
            user: user,
          ),
        ),
      );
    },
    cells: [
      DataCell(
        Text(user.fname),
      ),
      DataCell(
        Text(user.lname),
      ),
      DataCell(
        Text(user.pseudo),
      ),
      DataCell(
        Text(user.email),
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
