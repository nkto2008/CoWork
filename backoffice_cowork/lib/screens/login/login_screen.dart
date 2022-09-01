import 'package:backoffice_cowork/screens/home_admin/home_screen.dart';
import 'package:backoffice_cowork/widgets/custom_text.dart';
import 'package:backoffice_cowork/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../requests/auth.dart';
import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InputForm(
                              title: "Email",
                              placeholder: "email",
                              isPass: false,
                              inputController: emailController),
                          Container(
                            width: double.infinity,
                            height: 5,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding),
                      Column(
                        children: [
                          InputForm(
                              title: "Password",
                              placeholder: "password",
                              isPass: true,
                              inputController: passwordController),
                          Container(
                            width: double.infinity,
                            height: 5,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: MaterialStateMouseCursor.clickable,
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                text: "Login",
                                size: 20,
                                color: primaryColor,
                                font: "Comfortaa",
                                weight: FontWeight.bold,
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 16,
                                width: 16,
                                color: primaryColor,
                              ),
                            ],
                          ),
                          onTap: () async {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              String? res = await Auth.login(
                                  emailController.text,
                                  passwordController.text);
                              if (res != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Info")),
                                );
                              } else if (res ==
                                  'Email ou mot de passe incorrect') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(res!)),
                                );
                              } else {
                                //Navigation to dashboard_screen
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: HomeScreen()));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Informations manquantes')),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
