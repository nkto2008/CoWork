import 'package:backoffice_cowork/requests/users.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_user.dart';
import '../screens/user_admin/user_details.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class ModifyButtonUser extends StatefulWidget {
  User user;

  final String id;
  final TextEditingController lname;
  final TextEditingController fname;
  final TextEditingController pseudo;
  final TextEditingController email;
  final TextEditingController phone;

  ModifyButtonUser({
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
                      widget.id,
                      widget.lname.text,
                      widget.fname.text,
                      widget.pseudo.text,
                      widget.email.text,
                      widget.phone.text,
                    );
                    if (await res == 1) {
                      if (widget.lname.text.isNotEmpty) {
                        widget.user.lname = widget.lname.text;
                      }
                      if (widget.fname.text.isNotEmpty) {
                        widget.user.fname = widget.fname.text;
                      }
                      if (widget.pseudo.text.isNotEmpty) {
                        widget.user.pseudo = widget.pseudo.text;
                      }
                      if (widget.email.text.isNotEmpty) {
                        widget.user.email = widget.email.text;
                      }
                      if (widget.phone.text.isNotEmpty) {
                        widget.user.phone = widget.phone.text;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profil modifié"),
                        ),
                      );
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: UserDetails(
                            user: widget.user,
                          ),
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
                if (widget.lname.text.isEmpty &&
                    widget.fname.text.isEmpty &&
                    widget.email.text.isEmpty &&
                    widget.pseudo.text.isEmpty &&
                    widget.phone.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Modifiez au moins 1 champ"),
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
