import 'package:backoffice_cowork/screens/home_admin/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../requests/auth.dart';
import '../screens/login/login_screen.dart';
import '../screens/place_admin/place_screen.dart';
import '../screens/service_admin/service_screen.dart';
import '../screens/subscribe_admin/subscribe_screen.dart';
import '../screens/user_admin/user_screen.dart';
import '../utils/constants.dart';

class SideMenu extends StatelessWidget {
  final int select;

  const SideMenu({
    Key? key,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: defaultPadding),
            child: MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const HomeScreen()));
                },
                child: Icon(
                  Icons.home,
                  color: select == 1 ? lightCream : Colors.white38,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: defaultPadding),
            child: MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: const UserScreen()));
                },
                child: Icon(
                  Icons.person,
                  color: select == 2 ? lightCream : Colors.white38,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: defaultPadding),
            child: MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: const PlaceScreen()));
                },
                child: Icon(
                  Icons.apartment,
                  color: select == 3 ? lightCream : Colors.white38,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: defaultPadding),
            child: MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const ServiceScreen()));
                },
                child: Icon(
                  Icons.widgets,
                  color: select == 4 ? lightCream : Colors.white38,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: defaultPadding),
            child: MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const SubscribeScreen()));
                },
                child: Icon(
                  Icons.widgets,
                  color: select == 5 ? lightCream : Colors.white38,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding * 1.5),
            child: MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                onTap: () async {
                  String? res = await Auth.logout();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(res!),
                    ),
                  );
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: LoginScreen()));
                },
                child: const Icon(
                  Icons.logout,
                  color: lightCream,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
