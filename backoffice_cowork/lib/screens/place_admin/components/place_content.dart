import 'package:backoffice_cowork/models/model_place.dart';
import 'package:backoffice_cowork/models/model_user.dart';
import 'package:backoffice_cowork/requests/places.dart';
import 'package:backoffice_cowork/requests/users.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/places_data_row.dart';
import '../../../widgets/users_data_row.dart';

class PlaceContent extends StatefulWidget {
  const PlaceContent({Key? key}) : super(key: key);

  @override
  State<PlaceContent> createState() => _PlaceContentState();
}

class _PlaceContentState extends State<PlaceContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "Lieux", backward: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MouseRegion(
                    cursor: MaterialStateMouseCursor.clickable,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        color: primaryColor,
                        size: 35,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: FutureBuilder(
                        future: Places.getAllPlacesDesc(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor),
                              );
                              break;
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("Error: ${snapshot.error}"),
                                );
                              }
                              if (snapshot.hasData) {
                                final List<Place> places = snapshot.data;
                                if (places.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "Aucun lieu",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Helvetica',
                                        fontSize: 40,
                                        color: Colors.black12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }
                                return DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: defaultPadding,
                                  columns: const [
                                    DataColumn(
                                      label: Text(
                                        "ID",
                                        style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Nom",
                                        style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Ville",
                                        style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Code postal",
                                        style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(""),
                                    ),
                                  ],
                                  rows: List.generate(
                                    places.length,
                                    (index) =>
                                        placesDataRow(places[index], context),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    "Aucun Utilisateur",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Helvetica',
                                      fontSize: 40,
                                      color: Colors.black12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                              break;
                            default:
                              return Container();
                              break;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
