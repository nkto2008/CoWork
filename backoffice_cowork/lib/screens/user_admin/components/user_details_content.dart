import 'package:backoffice_cowork/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/model_user.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/modify_button_user.dart';
import '../../../widgets/suppression_button_user.dart';

class UserDetailsContent extends StatefulWidget {
  User user;

  UserDetailsContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserDetailsContent> createState() => _UserDetailsContentState();
}

class _UserDetailsContentState extends State<UserDetailsContent> {
  final TextEditingController lname = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController pseudo = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title:
                  "Utilisateur - ${widget.user.id} - ${widget.user.lname} ${widget.user.fname}",
              backward: true),
          Container(
            width: 740,
            height: 640,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(width: 8.0, color: primaryColor),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "ID :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                CustomText(
                                  text: widget.user.id,
                                  font: "Comfortaa",
                                  size: 15,
                                  align: TextAlign.left,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Nom :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: lname,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.user.lname,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Prénom :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: fname,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.user.fname,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Pseudo :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: pseudo,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.user.pseudo,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Email :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: email,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.user.email,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Phone :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: phone,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.user.phone,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ModifyButtonUser(
                        user: widget.user,
                        id: widget.user.id,
                        lname: lname,
                        fname: fname,
                        pseudo: pseudo,
                        email: email,
                        phone: phone,
                      ),
                      const SizedBox(height: defaultPadding),
                      SuppressionButtonUser(user: widget.user),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
