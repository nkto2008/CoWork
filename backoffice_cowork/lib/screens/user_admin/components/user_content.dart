import 'package:backoffice_cowork/models/model_user.dart';
import 'package:backoffice_cowork/requests/users.dart';
import 'package:backoffice_cowork/screens/user_admin/new_user.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/users_data_row.dart';

class UserContent extends StatefulWidget {
  const UserContent({Key? key}) : super(key: key);

  @override
  State<UserContent> createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "Utilisateur", backward: false),
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
                            child: const NewUser(),
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
                        future: Users.getAllUsersDesc(),
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
                                final List<User> users = snapshot.data;
                                if (users.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "Aucun utilisateur",
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
                                        "Prénom",
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
                                        "Pseudo",
                                        style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Email",
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
                                    users.length,
                                    (index) => usersDataRow(users[index], context),
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
