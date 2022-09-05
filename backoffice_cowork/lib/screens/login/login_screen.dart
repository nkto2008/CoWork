import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'components/form_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(defaultPadding),
            child: Image.asset(
              'assets/images/CoWork.png',
              height: 75,
              width: 75,
            ),
          ),
          Center(
            child: Container(
              height: 520,
              width: 440,
              padding: const EdgeInsets.all(defaultPadding * 2),
              decoration: BoxDecoration(
                border: Border.all(width: 8.0, color: primaryColor),
              ),
              child: FormLogin(),
            ),
          ),
        ],
      ),
    );
  }
}
