import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_place.dart';
import '../requests/places.dart';
import '../screens/place_admin/place_screen.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class SuppressionButtonPlace extends StatefulWidget {
  final Place place;

  const SuppressionButtonPlace({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  State<SuppressionButtonPlace> createState() => _SuppressionButtonPlaceState();
}

class _SuppressionButtonPlaceState extends State<SuppressionButtonPlace> {
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
                    var res = Places.delPlace(widget.place.id);
                    if (await res) {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const PlaceScreen()));
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
