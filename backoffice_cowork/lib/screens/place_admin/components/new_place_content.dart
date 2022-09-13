import 'package:backoffice_cowork/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants.dart';
import '../../../widgets/create_button_place.dart';
import '../../../widgets/custom_appbar.dart';

class NewPlaceContent extends StatefulWidget {
  const NewPlaceContent({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPlaceContent> createState() => _NewPlaceContentState();
}

class _NewPlaceContentState extends State<NewPlaceContent> {
  @override
  Widget build(BuildContext context) {
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
          const CustomAppBar(title: "Création de lieu", backward: true),
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
                                  decoration: const InputDecoration(
                                    hintText: "nom",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
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
                                  decoration: const InputDecoration(
                                    hintText: "ville",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
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
                                  decoration: const InputDecoration(
                                    hintText: "code postal",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                              decoration: const InputDecoration(
                                hintText: "horaire",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
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
                      CreateButtonPlace(
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
