import 'package:backoffice_cowork/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/model_place.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/modify_button_place.dart';
import '../../../widgets/suppression_button_place.dart';

class PlaceDetailsContent extends StatefulWidget {
  final Place place;

  const PlaceDetailsContent({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  State<PlaceDetailsContent> createState() => _PlaceDetailsContentState();
}

class _PlaceDetailsContentState extends State<PlaceDetailsContent> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController id = TextEditingController();
    final TextEditingController name = TextEditingController();
    final TextEditingController city = TextEditingController();
    final TextEditingController zip = TextEditingController();

    final TextEditingController monday = TextEditingController();
    final TextEditingController tuesday = TextEditingController();
    final TextEditingController wednesday = TextEditingController();
    final TextEditingController thursday = TextEditingController();
    final TextEditingController friday = TextEditingController();
    final TextEditingController saturday = TextEditingController();
    final TextEditingController sunday = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title:
                  "Lieu - ${widget.place.id} - ${widget.place.name} ${widget.place.city}",
              backward: true),
          Container(
            width: 940,
            height: 640,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(width: 8.0, color: primaryColor),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "ID : ",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: id,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.place.id,
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
                                  text: "Nom :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.place.name,
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
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Ville :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: city,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: widget.place.city,
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
                                  text: "Code postal :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: zip,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "${widget.place.cp}",
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
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          "Lundi",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Mardi",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Mercredi",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Jeudi",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Vendredi",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Samedi",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Dimanche",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            TextFormField(
                              controller: monday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[0].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          DataCell(
                            TextFormField(
                              controller: tuesday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[1].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          DataCell(
                            TextFormField(
                              controller: wednesday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[2].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          DataCell(
                            TextFormField(
                              controller: thursday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[3].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          DataCell(
                            TextFormField(
                              controller: friday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[4].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          DataCell(
                            TextFormField(
                              controller: saturday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[5].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          DataCell(
                            TextFormField(
                              controller: sunday,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                              ),
                              decoration: InputDecoration(
                                hintText: widget.place.schedules[6].time,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ModifyButtonPlace(
                        place: widget.place,
                        id: id,
                        name: name,
                        city: city,
                        zip: zip,
                        monday: monday,
                        tuesday: tuesday,
                        wednesday: wednesday,
                        thursday: thursday,
                        friday: friday,
                        saturday: saturday,
                        sunday: sunday,
                      ),
                      const SizedBox(height: defaultPadding),
                      SuppressionButtonPlace(place: widget.place),
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
