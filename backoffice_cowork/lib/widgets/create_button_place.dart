import 'package:backoffice_cowork/requests/places.dart';
import 'package:backoffice_cowork/requests/users.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/place_admin/place_screen.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class CreateButtonPlace extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController city;
  final TextEditingController zip;

  final TextEditingController monday;
  final TextEditingController tuesday;
  final TextEditingController wednesday;
  final TextEditingController thursday;
  final TextEditingController friday;
  final TextEditingController saturday;
  final TextEditingController sunday;

  const CreateButtonPlace({
    Key? key,
    required this.name,
    required this.city,
    required this.zip,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  }) : super(key: key);

  @override
  State<CreateButtonPlace> createState() => _CreateButtonPlaceState();
}

class _CreateButtonPlaceState extends State<CreateButtonPlace> {
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
                    var res = Places.createPlace(
                        widget.name.text,
                        widget.city.text,
                        widget.zip.text,
                        widget.monday.text,
                        widget.tuesday.text,
                        widget.wednesday.text,
                        widget.thursday.text,
                        widget.friday.text,
                        widget.saturday.text,
                        widget.sunday.text);
                    if (await res == 1) {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const PlaceScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Lieu créé"),
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
                if (widget.name.text.isEmpty ||
                    widget.city.text.isEmpty ||
                    widget.zip.text.isEmpty ||
                    widget.monday.text.isEmpty ||
                    widget.tuesday.text.isEmpty ||
                    widget.wednesday.text.isEmpty ||
                    widget.thursday.text.isEmpty ||
                    widget.friday.text.isEmpty ||
                    widget.saturday.text.isEmpty ||
                    widget.sunday.text.isEmpty) {
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
