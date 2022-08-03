import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 520,
        width: 440,
        decoration: BoxDecoration(
          border: Border.all(width: 8.0, color: primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding * 2),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Auth.",
                    style: GoogleFonts.getFont(
                      'Bungee Shade',
                      textStyle: const TextStyle(
                        fontSize: 50,
                        decoration: TextDecoration.none,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
