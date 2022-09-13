import 'package:backoffice_cowork/requests/users.dart';
import 'package:backoffice_cowork/screens/user_admin/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_user.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class CreateButtonUser extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController lname;
  final TextEditingController fname;
  final TextEditingController pseudo;
  final TextEditingController phone;
  final String rule;

  const CreateButtonUser({
    Key? key,
    required this.email,
    required this.password,
    required this.lname,
    required this.fname,
    required this.pseudo,
    required this.phone,
    required this.rule,
  }) : super(key: key);

  @override
  State<CreateButtonUser> createState() => _CreateButtonUserState();
}

class _CreateButtonUserState extends State<CreateButtonUser> {
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
                    var res = Users.createUser(
                        widget.email.text,
                        widget.password.text,
                        widget.pseudo.text,
                        widget.lname.text,
                        widget.fname.text,
                        widget.phone.text,
                        widget.rule);
                    print(res);
                    if (await res == 1) {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const UserScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profil créé"),
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
                if (widget.email.text.isEmpty ||
                    widget.password.text.isEmpty ||
                    widget.lname.text.isEmpty ||
                    widget.fname.text.isEmpty ||
                    widget.pseudo.text.isEmpty ||
                    widget.phone.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tous les champs doivent être remplis"),
                    ),
                  );
                } else {
                  confirm();
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: CustomText(
                  text: "CRÉER",
                  color: lightCream,
                  font: "Comfortaa",
                  size: 20,
                ),
              ),
            ),
    );
  }
}
