import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../requests/auth.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/input_form.dart';
import '../../home_admin/home_screen.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Column(
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

                      if(res != null){
                        if(res == 'good'){
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const HomeScreen()));
                        }
                        if (res ==
                            'Email ou mot de passe incorrect') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(res)),
                          );
                        }

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('une erreur est survenue')),
                        );
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
    );
  }
}