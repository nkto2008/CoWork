import 'package:backoffice_cowork/models/model_subscribe.dart';
import 'package:backoffice_cowork/models/model_user.dart';
import 'package:backoffice_cowork/requests/users.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../requests/subscribes.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/subscribes_data_row.dart';
import '../../../widgets/users_data_row.dart';
import '../new_subscribe.dart';

class SubscribeContent extends StatefulWidget {
  const SubscribeContent({Key? key}) : super(key: key);

  @override
  State<SubscribeContent> createState() => _SubscribeContentState();
}

class _SubscribeContentState extends State<SubscribeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "Abonnements", backward: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MouseRegion(
                    cursor: MaterialStateMouseCursor.clickable,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: Container()/*const NewSubscribe()*/,
                          ),
                        );
                      },
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
                        future: Subscribes.getAllSubscribesDesc(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child:
                                CircularProgressIndicator(color: primaryColor),
                              );
                              break;
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("Error: ${snapshot.error}"),
                                );
                              }
                              if (snapshot.hasData) {
                                final List<Subscribe> subscribes = snapshot.data;
                                if (subscribes.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "Aucun abonnement",
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
                                        "Prix",
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
                                    subscribes.length,
                                        (index) => subscribesDataRow(subscribes[index], context),
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
                            default:
                              return Container();
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
