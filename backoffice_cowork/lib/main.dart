import 'package:backoffice_cowork/screens/login/login_screen.dart';
import 'package:backoffice_cowork/utils/constants.dart';
import 'package:backoffice_cowork/utils/tokenPreferences.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoWork',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightCream,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        final dynamic arguments = settings.arguments;
        switch (settings.name) {
          case "/":
            return TokenSimplePreferences.getToken('token') != null
                ? PageTransition(
                child: LoginScreen(), type: PageTransitionType.fade)
                : PageTransition(
                child: LoginScreen(), type: PageTransitionType.fade);
            break;
          default:
            return MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen());
            break;
        }
      },
    );
  }
}
