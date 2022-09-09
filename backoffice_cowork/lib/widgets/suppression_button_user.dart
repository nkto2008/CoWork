import 'package:backoffice_cowork/requests/users.dart';
import 'package:backoffice_cowork/screens/user_admin/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_user.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class SuppressionButtonUser extends StatefulWidget {
  final User user;

  const SuppressionButtonUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<SuppressionButtonUser> createState() => _SuppressionButtonUserState();
}

class _SuppressionButtonUserState extends State<SuppressionButtonUser> {
  bool display = false;

  void confirm() {
    setState(() {
      display = !display;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: display
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    confirm();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: redSup,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2),
                    child: CustomText(
                      text: "NON",
                      color: lightCream,
                      font: "Comfortaa",
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
                TextButton(
                  onPressed: () async {
                    var res = Users.delUser(widget.user.id);
                    if(await res){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: const UserScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Utilisateur supprimé"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Une erreur est survenue"),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2),
                    child: CustomText(
                      text: "OUI",
                      color: lightCream,
                      font: "Comfortaa",
                      size: 15,
                    ),
                  ),
                ),
              ],
            )
          : TextButton(
              onPressed: () {
                confirm();
              },
              style: TextButton.styleFrom(
                backgroundColor: redSup,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: CustomText(
                  text: "SUPPRIMER",
                  color: lightCream,
                  font: "Comfortaa",
                  size: 20,
                ),
              ),
            ),
    );
  }
}
