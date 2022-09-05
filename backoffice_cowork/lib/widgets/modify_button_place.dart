import 'package:flutter/material.dart';

import '../models/model_place.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class ModifyButtonPlace extends StatefulWidget {
  final Place place;

  final TextEditingController id;
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

  const ModifyButtonPlace({
    Key? key,
    required this.place,
    required this.id,
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
  State<ModifyButtonPlace> createState() => _ModifyButtonPlaceState();
}

class _ModifyButtonPlaceState extends State<ModifyButtonPlace> {

  bool display = false;

  void confirm(){
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
              /*var res = Places.delPlace(widget.place.id);
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
              }*/
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
