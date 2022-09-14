import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_place.dart';
import '../requests/places.dart';
import '../screens/place_admin/place_details.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class ModifyButtonPlace extends StatefulWidget {
  Place place;

  final String id;
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

  ModifyButtonPlace({
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
                    var res = Places.updatePlace(
                        widget.id,
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
                      if (widget.name.text.isNotEmpty) {
                        widget.place.name = widget.name.text;
                      }
                      if (widget.city.text.isNotEmpty) {
                        widget.place.city = widget.city.text;
                      }
                      if (widget.zip.text.isNotEmpty) {
                        widget.place.cp = widget.zip.text as int;
                      }
                      if (widget.monday.text.isNotEmpty) {
                        widget.place.schedules[0].time = widget.monday.text;
                      }
                      if (widget.tuesday.text.isNotEmpty) {
                        widget.place.schedules[1].time = widget.tuesday.text;
                      }
                      if (widget.wednesday.text.isNotEmpty) {
                        widget.place.schedules[2].time = widget.wednesday.text;
                      }
                      if (widget.thursday.text.isNotEmpty) {
                        widget.place.schedules[3].time = widget.thursday.text;
                      }
                      if (widget.friday.text.isNotEmpty) {
                        widget.place.schedules[4].time = widget.friday.text;
                      }
                      if (widget.saturday.text.isNotEmpty) {
                        widget.place.schedules[5].time = widget.saturday.text;
                      }
                      if (widget.sunday.text.isNotEmpty) {
                        widget.place.schedules[6].time = widget.sunday.text;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Lieu modifié"),
                        ),
                      );
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: PlaceDetails(
                            place: widget.place,
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
