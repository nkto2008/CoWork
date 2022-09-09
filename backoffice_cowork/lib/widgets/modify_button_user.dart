import 'package:backoffice_cowork/requests/users.dart';
import 'package:backoffice_cowork/screens/user_admin/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_user.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class ModifyButtonUser extends StatefulWidget {
  final User user;

  final TextEditingController id;
  final TextEditingController lname;
  final TextEditingController fname;
  final TextEditingController pseudo;
  final TextEditingController email;
  final TextEditingController phone;

  const ModifyButtonUser({
    Key? key,
    required this.user,
    required this.id,
    required this.lname,
    required this.fname,
    required this.pseudo,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  State<ModifyButtonUser> createState() => _ModifyButtonUserState();
}

class _ModifyButtonUserState extends State<ModifyButtonUser> {
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
                    var res = Users.updateUser(
                      widget.user,
                      widget.id.text,
                      widget.lname.text,
                      widget.fname.text,
                      widget.pseudo.text,
                      widget.email.text,
                      widget.phone.text,
                    );
                    if (await res) {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const UserScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Lieu supprimé"),
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
                backgroundColor: primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: CustomText(
                  text: "MODIFIER",
                  color: lightCream,
                  font: "Comfortaa",
                  size: 20,
                ),
              ),
            ),
    );
  }
}
