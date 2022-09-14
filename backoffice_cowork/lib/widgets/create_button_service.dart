import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../requests/services.dart';
import '../screens/service_admin/service_screen.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class CreateButtonService extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController price;

  const CreateButtonService({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  State<CreateButtonService> createState() => _CreateButtonServiceState();
}

class _CreateButtonServiceState extends State<CreateButtonService> {
  bool display = false;

  void confirm() {
    setState(() {
      display = !display;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: display
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              confirm();
            },
            style: TextButton.styleFrom(
              backgroundColor: redSup,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2),
              child: CustomText(
                text: "NON",
                color: lightCream,
                font: "Comfortaa",
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: defaultPadding),
          TextButton(
            onPressed: () async {
              var res = Services.createService(
                  widget.name.text,
                  widget.price.text);
              if (await res == 1) {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const ServiceScreen()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Service créé"),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Une erreur est survenue"),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2),
              child: CustomText(
                text: "OUI",
                color: lightCream,
                font: "Comfortaa",
                size: 15,
              ),
            ),
          ),
        ],
      )
          : TextButton(
        onPressed: () {
          if (widget.name.text.isEmpty ||
              widget.price.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Tous les champs doivent être remplis"),
              ),
            );
          } else {
            confirm();
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: CustomText(
            text: "CRÉER",
            color: lightCream,
            font: "Comfortaa",
            size: 20,
          ),
        ),
      ),
    );
  }
}
